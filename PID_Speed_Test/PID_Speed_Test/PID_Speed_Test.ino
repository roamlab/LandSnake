/*
Columbia University ROAM LandSnake: 
Central Teensy with added PID/Dynamixel/Encoder Firmware Script
Updated by Rich Gedney
Last Updated October 22, 2021
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
const uint LINKID = 1; // LINK ID
FlexCAN_T4<CAN1, RX_SIZE_256, TX_SIZE_16> Can0; // INIT CAN COMMUNICATION
CAN_message_t fb_msg; // FEEDBACK MESSAGE
CAN_message_t cmd; // COMMAND MESSAGE
Dynamixel2Arduino dxl(DXL_SERIAL,DXL_DIR_PIN); // DXL MOTOR OBJECT

int this_ang; // INTERMEDIATE VAR FOR ENCODING ANGLE ON CANBUF

// PID RELATED
unsigned int FBPERIOD_US = 10000; // PERIOD OF FEEDBACK TIMING
unsigned int PIDPERIOD_US = 20000; // PERIOD OF PID TIMING
unsigned int PID_Count=0;

double error; // CONTROLLER ERROR, RELATIVE TO CMD
double errorsum; // INTEGRAL TERM IN CONTROLLER
double damped_enc_angle = (90*analogRead(Encoder_pin)/1024.0)-45.0;
double last_damped_enc_angle;
double dAngle; // RATE OF CHANGE OF ERROR (ANGLE - LAST ANGLE)
double current_dxl_angle; // CURRENT DYNAMIXEL ANGLE
double command_angle; // ANGLE TO BE SENT TO DXL

double kp = 0.4, ki = 0.0000 , kd = 0.2; // CONTROLLER GAINS
double outmin=-20, outmax=20; // MAX MOTOR DISPLACEMENTS

float angle;
bool flag = false;
float goalpoint= (90*analogRead(Encoder_pin)/1024.0)-45.0; // GOAL POINT, COMMANDED FROM CENTRAL PERIODICALLY, UPDATED BY EXECUTECOMMAND()
float starttime;

float starting_position;
float dxl_angle;

// TIMERS
IntervalTimer FeedbackTimer; // TIMED INTERRUPT FOR STREAMING FEEDBACK
IntervalTimer PIDTimer; // TIMED INTERRUPT FOR MOTOR CONTROL

// FUNCTIONS
void SendLog(); // STREAMS FEEDBACK -> CAN -> CENTRAL -> ROS
void UpdateSetPoint(const CAN_message_t &cmd); // READS COMMAND FROM CAN, UPDATES SET POINT
void ExecuteCommand(); // PERIODICALLY SENDS SET POINT TO MOTOR


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


// STORES DESIRED ANGLE COMMANDED FROM CAN
void UpdateSetPoint(const CAN_message_t &cmd){
  if(cmd.id==LINKID){
    goalpoint = (cmd.buf[1]*100 + cmd.buf[2])/100.0; // GOAL POINT TO BE PID'D
    if(cmd.buf[3]==1){goalpoint*=-1;} // NEGATIVE ANGLE
  } 
}

// PID FUNCTION: ATTENUATES ERROR BETWEEN MOST RECENT COMMAND POINT AND CURRENT ANGLE
void ExecuteCommand() {
  //Debugging Section
  if(PID_Count%)





  
  damped_enc_angle = (1-0.915)*((90*analogRead(Encoder_pin)/1024.0)-45.0) + 0.915*damped_enc_angle; // DENOISED CURRENT ANGLE OF ENCODER PIN, IN DEGREES
  error = goalpoint - damped_enc_angle; // COMPUTING ANGLE ERROR, GOALPOINT COMES OFF OF CAN

  current_dxl_angle = dxl.getPresentPosition(DXL_ID, UNIT_DEGREE); // CURRENT DXL ANGLE, SHOULD NOT BE NEEDED?

  if(abs(error)>=0.4){ // CONSIDER CHANGING TO ">= RESOLUTION" ?
  
    errorsum+=error; // INTEGRAL ERROR
    
    dAngle = damped_enc_angle - last_damped_enc_angle; // DERIVATIVE OF ERROR
    last_damped_enc_angle = damped_enc_angle; // STORING ANGLE FOR NEXT ITERATION

    command_angle = kp*error + ki*errorsum - kd*dAngle; // TUNED ERROR SIGNAL

    if(command_angle>outmax){command_angle=outmax;} // CAPPING MAXIMUM OUTPUT
    else if (command_angle<outmin){command_angle=outmin;} // CAPPING MINIMUM OUTPUT
    
    } // TO THIS POINT, COMMAND ANGLE IS EITHER THE 
    
    dxl.setGoalPosition(DXL_ID, current_dxl_angle - command_angle , UNIT_DEGREE); // SHOULD THIS BE IN OR OUT OF THE CONDITIONAL?
    
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
  Can0.enableMBInterrupts(); // ENABLE CAN INTERRUPT ON
  Can0.onReceive(UpdateSetPoint); // LINK CAN INTERRUPT TO FUNCTION
  FeedbackTimer.begin(SendLog,FBPERIOD_US); // SETS INTERVAL OF FEEDBACK
  PIDTimer.begin(ExecuteCommand, PIDPERIOD_US); // SETS INTERVAL OF CONTROL
}

void loop() {}
