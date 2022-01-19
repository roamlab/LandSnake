/*
Columbia University ROAM LandSnake: 
Central Teensy with added PID/Dynamixel/Encoder Firmware Script
Updated by Jobin Binoy George
Last Updated November 02, 2021
*/

#include<Dynamixel2Arduino.h> // DXL COMMS HEADER FILE
const uint8_t DXL_ID=1, DXL_DIR_PIN=2; // DXL MOTOR ID AND DIRECTION
const float DXL_PROTOCOL_VERSION=1.0; // DXL COMM PROTOCOL
using namespace ControlTableItem; // DXL CONTROL TABLE
#define DXL_SERIAL Serial1 // SERIAL COMMS
#define DEBUG_SERIAL Serial // DEBUG SERIAL (NOT NEEDED)
#include <FlexCAN_T4.h> // CAN COMMUNICATION HEADER FILE


//*******************************************************************************FUNCTION DECLARATIONS, VARIABLES, OBJECTS*****************************************************************************

// HARDWARE RELATED
const uint Encoder_pin = 19; // ENCODER PINOUT
const uint LEDPIN = 23; // ONBOARD LED PIN
const uint LINKID = 3; // LINK ID
FlexCAN_T4<CAN1, RX_SIZE_256, TX_SIZE_16> Can0; // INIT CAN COMMUNICATION
CAN_message_t fb_msg; // FEEDBACK MESSAGE
CAN_message_t cmd; // COMMAND MESSAGE
Dynamixel2Arduino dxl(DXL_SERIAL,DXL_DIR_PIN); // DXL MOTOR OBJECT

int this_ang; // INTERMEDIATE VAR FOR ENCODING ANGLE ON CANBUF

// PID RELATED
unsigned int FBPERIOD_US = 10000; // PERIOD OF FEEDBACK TIMING
unsigned int PIDPERIOD_US = 950; // PERIOD OF PID TIMING
unsigned int CANPERIOD_US = 800;

float damped_enc_angle = (90*Encoder_pin/1024.0)-45.0;; 
float default_ang;
float kp = 0.6, ki = 0, kd =8; // GAINS 
float outmin, outmax;
float Input, Output; // PID I/O STUFF
float Iterm=0, lastInput=0, derror=0; // PID 
float command_angle; // PID OUTPUT SENT TO DXL
float error;
float lasterror=0;
float timenow;
float dt=0;
float lasttime=0;
float current_dxl_angle; // CURRENT DYNAMIXEL ANGLE


float goalpoint = (1-0.915)*((90*analogRead(Encoder_pin)/1024.0)-45.0) + 0.915*(90*analogRead(Encoder_pin)/1024.0)-45.0; // GOAL POINT, COMMANDED FROM CENTRAL PERIODICALLY, UPDATED BY EXECUTECOMMAND()
float starttime;

float starting_position;
float dxl_angle;

// TIMERS
IntervalTimer FeedbackTimer; // TIMED INTERRUPT FOR STREAMING FEEDBACK
IntervalTimer PIDTimer; // TIMED INTERRUPT FOR MOTOR CONTROL
IntervalTimer CANTimer;

// FUNCTIONS
void SendLog(); // STREAMS FEEDBACK -> CAN -> CENTRAL -> ROS
void UpdateSetPoint(const CAN_message_t &cmd); // READS COMMAND FROM CAN, UPDATES SET POINT
void ExecuteCommand(); // PERIODICALLY SENDS SET POINT TO MOTOR
bool received = false;


//******************************************************************************************FUNCTIONS*************************************************************************************************

// PERIODIC FEEDBACK TO CENTRAL

void SendLog()  
{
  dxl_angle=dxl.getPresentPosition(DXL_ID, UNIT_DEGREE); // PRESENT POSITION OF DXL
  damped_enc_angle=((1-0.915)*((90*analogRead(Encoder_pin)/1024.0)-45.0) + 0.915*damped_enc_angle); // PRESENT ENCODER ANGLE

  fb_msg.id = 0; // SETS FEEDBACK DESTINATION TO CENTRAL LINK
  fb_msg.buf[0] = LINKID; // SETS ID OF ORIGIN LINK 
  
  // ANGLE ENCODING FUNCTION
  if(damped_enc_angle<0){fb_msg.buf[5]=1;this_ang=damped_enc_angle*(-100);} // CHECKING NEGATIVE
  else{this_ang=damped_enc_angle*100;fb_msg.buf[5]=0;} // FILLING
  int enc_first_half = (int)this_ang / 100; int enc_second_half = (int)this_ang%100; // ENCODING enc
  int dxl_first_half = (int)dxl_angle & 255; int dxl_second_half = (int)dxl_angle>>8; // ENCODING DXL
  fb_msg.buf[1]=enc_first_half;fb_msg.buf[2]=enc_second_half; // WRITING TO fb_msg
  fb_msg.buf[3]=dxl_first_half;fb_msg.buf[4]=dxl_second_half; // WRITING TO fb_msg
  for(int i = 6; i<8; i++) fb_msg.buf[i] = 0; // CLEARING SUBSEQUENT POSITIONS

  Can0.write(fb_msg); // SENDING MESSAGE ONTO CAN
  Can0.events(); // PUSHES CAN INTERRUPT FRAMES
  
}
//CAN
void CAN(){
  Can0.events();
  //float time1 = micros();
  //float t1 = time1/1000000;
  //goalpoint = 35*sin(2*(t1));
  }



// STORES DESIRED ANGLE COMMANDED FROM CAN
void UpdateSetPoint(const CAN_message_t &cmd){
 
    goalpoint = (cmd.buf[1]*100 + cmd.buf[2])/100.0; // GOAL POINT TO BE PID'D
    if(cmd.buf[3]==1){goalpoint*=-1;} // NEGATIVE ANGLE
  
}

// PID FUNCTION: ATTENUATES ERROR BETWEEN MOST RECENT COMMAND POINT AND CURRENT ANGLE
void ExecuteCommand() {

  timenow = micros();
  if(dt <= 0 || lasttime==0 ){dt = 1e-6; }
  else{dt = timenow-lasttime;}

  
  damped_enc_angle = (1-0.915)*((90*analogRead(Encoder_pin)/1024.0)-45.0) + 0.915*(90*analogRead(Encoder_pin)/1024.0)-45.0;// DENOISED CURRENT ANGLE OF ENCODER PIN, IN DEGREES
    
  
  Input = damped_enc_angle;
  
  error = goalpoint - Input; // COMPUTING ANGLE ERROR, GOALPOINT COMES OFF OF CAN

  current_dxl_angle = dxl.getPresentPosition(DXL_ID, UNIT_DEGREE); // CURRENT DXL ANGLE, SHOULD NOT BE NEEDED?

  if(abs(error)>0.3){ // CONSIDER CHANGING TO ">= RESOLUTION" ?
  
    Iterm+=ki*error*dt;
    derror = error-lasterror;
    Output = (kp*error)+Iterm+(kd*derror)/dt;
    //Serial.print(Output);
    if(Output>outmax){Output=outmax;}
    else if (Output<outmin){Output=outmin;}

    lastInput = Input;
    lasttime = timenow;
    lasterror = error;
    
    } // TO THIS POINT, COMMAND ANGLE IS EITHER THE 
    
    dxl.setGoalPosition(DXL_ID, current_dxl_angle - Output , UNIT_DEGREE); // SHOULD THIS BE IN OR OUT OF THE CONDITIONAL?
    
}


void setup() {
  pinMode(6, OUTPUT); digitalWrite(6, LOW); // CAN TRANSCEIVER ENABLE
  dxl.begin(1000000); // BEGIN DYNAMIXEL AT BAUD RATE
  dxl.setPortProtocolVersion(DXL_PROTOCOL_VERSION);
  dxl.ping(DXL_ID);
  dxl.torqueOff(DXL_ID);
  dxl.setOperatingMode(DXL_ID,OP_POSITION);
  dxl.writeControlTableItem(CW_COMPLIANCE_MARGIN, DXL_ID, 1);
  dxl.writeControlTableItem(CCW_COMPLIANCE_MARGIN, DXL_ID, 1);
  dxl.writeControlTableItem(RETURN_DELAY_TIME, DXL_ID, 0);
  dxl.torqueOn(DXL_ID);
  Can0.begin(); // BEGIN CAN0
  Can0.setBaudRate(1000000); // SET BAUDRATE
  Can0.setMaxMB(16); // SET MAX MAILBOX SIZE... COULD BE USEFUL TO PLAY WITH THIS?
  Can0.setMBFilter(MB0, LINKID);
  Can0.enhanceFilter(MB0);
  Can0.enableMBInterrupts(); // ENABLE CAN INTERRUPT ON
  Can0.onReceive(MB0, UpdateSetPoint); // LINK CAN INTERRUPT TO FUNCTION
  FeedbackTimer.begin(SendLog,FBPERIOD_US); // SETS INTERVAL OF FEEDBACK
  PIDTimer.begin(ExecuteCommand, PIDPERIOD_US); // SETS INTERVAL OF CONTROL
  CANTimer.begin(CAN,CANPERIOD_US); //SETS INTERVAL OF CAN
  outmax = 90;
  outmin = -90;
}

void loop() {}
