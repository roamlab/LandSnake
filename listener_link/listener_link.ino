/*
Columbia University ROAM LandSnake: 
Central Teensy with added PID/Dynamixel/Encoder Firmware Script
Updated by Jobin Binoy George
Last Updated June 27, 2021

*/

#include<Dynamixel2Arduino.h>
const uint8_t DXL_ID=1, DXL_DIR_PIN=2;
const float DXL_PROTOCOL_VERSION=1.0;
using namespace ControlTableItem;
#define DXL_SERIAL Serial1
#define DEBUG_SERIAL Serial
Dynamixel2Arduino dxl(DXL_SERIAL,DXL_DIR_PIN);

const uint8_t Encoder_pin = 19;
float time1, t1;
double Setpoint, Input, Output;
double Iterm, lastInput;
double command_angle;
float test = (90*analogRead(Encoder_pin)/1024.0)-45.0;
float enc_angle = (90*analogRead(Encoder_pin)/1024.0)-45.0;
float res = 1024;
float anglim = 89;
double default_ang;
double kp = 1.15, ki = 0.0001 , kd = 1.6; 
double outmin, outmax;
unsigned int FBFREQ = 10000; // PERIOD OF FEEDBACK TIMING, in microseconds
unsigned int PIDFREQ = 600;  // in microseconds
float angle;
bool flag = false;
float goalpoint= (90*analogRead(Encoder_pin)/1024.0)-45.0;//85*sin(0.12*(micros()/1000000));//30;//
float starttime;
int this_ang;
#include <FlexCAN_T4.h>
FlexCAN_T4<CAN1, RX_SIZE_256, TX_SIZE_16> Can0; // INIT CAN COMMUNICATION TESTING

IntervalTimer FeedbackTimer;
IntervalTimer PIDTimer;
CAN_message_t fb_msg; // FEEDBACK MESSAGE
// FUNCTIONS AND VARIABLES

void SendLog(); // THE REAL ISR: CONTAINS ALL LOGGING CODE
//void executeCommand(const CAN_message_t &cmd); // CONTROLS DXL USING COMMANDS RECEIVED OVER CAN
void executeCommand();
void SetPoint(const CAN_message_t &cmd);
CAN_message_t cmd;
const uint LEDPIN = 23; // ONBOARD LED PIN
const uint LINKID = 4; // LINK ID
float starting_position;


void SendLog()  
{
  //long starttime = micros(); 
  float dxl_angle=dxl.getPresentPosition(DXL_ID, UNIT_DEGREE);//-starting_position;
  
  //long endtime = micros();
  enc_angle=((1-0.915)*((90*analogRead(Encoder_pin)/1024.0)-45.0) + 0.915*enc_angle);
  //enc_angle = Setpoint;
  //Serial.print("This is enc_angle");
  //Serial.println(enc_angle);
  //int this_ang = 100*enc_angle;
  //Serial.println(this_ang);
  
  //Serial.println(endtime-starttime);
  //Serial.println(dxl_angle);

  //delay(1);
  fb_msg.id = 0; // SETS DESTINATION OF MESSAGE TO CENTRAL
  fb_msg.buf[0] = LINKID; // ID OF ORIGIN LINK
  if(enc_angle<0){fb_msg.buf[5]=1;this_ang=enc_angle*(-100);}
  else{this_ang=enc_angle*100;fb_msg.buf[5]=0;}
  int enc_first_half = (int)this_ang / 100; int enc_second_half = (int)this_ang%100; // ENCODING enc
  //Serial.println(enc_first_half );
  //Serial.println(enc_second_half);
  //Serial.println((enc_first_half*100 + enc_second_half)/100.0);
  int dxl_first_half = (int)dxl_angle & 255; int dxl_second_half = (int)dxl_angle>>8; // ENCODING DXL
  fb_msg.buf[1]=enc_first_half;fb_msg.buf[2]=enc_second_half; // WRITING TO fb_msg
  fb_msg.buf[3]=dxl_first_half;fb_msg.buf[4]=dxl_second_half; // WRITING TO fb_msg
  for(int i = 6; i<8; i++) fb_msg.buf[i] = 0; // CLEARING SUBSEQUENT POSITIONS
  Can0.write(fb_msg);
  
}

void SetPoint(const CAN_message_t &cmd){
  //Serial.print("Reached");
  if(cmd.id==LINKID){
    //noInterrupts();
    goalpoint = (cmd.buf[1]*100 + cmd.buf[2])/100.0;
    if(cmd.buf[3]==1){goalpoint*=-1;}
    //Serial.print("This is goalpoint");
    //Serial.println(goalpoint);
       //interrupts();
  }
    
}

void ExecuteCommand() {

   Setpoint = goalpoint; 
  //Serial.print("This is Setpoint");
  //Serial.println(Setpoint);
  
  
  //if(Setpoint<0){Setpoint*=-1;}
  //Serial.println(Setpoint);
  test = (1-0.915)*((90*analogRead(Encoder_pin)/1024.0)-45.0) + 0.915*test; //transfer to degree, moving average to eliminate noise
  //Setpoint = abs(85*sin(0.12*(micros()/1000000)));
  Setpoint = goalpoint;
  Input = test;
  double currpos = dxl.getPresentPosition(DXL_ID, UNIT_DEGREE);
  //myPID.Compute();
  //command_angle = Output;
  //noInterrupts();
  //__disable_irq();
  double error = Setpoint - Input;
  if(abs(error)>=0.4){
  
    Iterm+=ki*error;
    if(Iterm>outmax){Iterm=outmax;}
    else if(Iterm<outmin){Iterm=outmin;}
    double dInput = Input - lastInput;

    Output = kp*error+Iterm-kd*dInput;
    if(Output>outmax){Output=outmax;}
    else if (Output<outmin){Output=outmin;}

    lastInput = Input;
    
    command_angle = Output;
    
    dxl.setGoalPosition(DXL_ID, currpos - command_angle , UNIT_DEGREE);
    
    
    
    
    }
    
}


void setup() {
  //Serial.begin(115200); // SERIAL: CAN KILL THIS LATER
  pinMode(6, OUTPUT); digitalWrite(6, LOW); // CAN TRANSCEIVER ENABLE
  //pinMode(LEDPIN, OUTPUT); digitalWrite(LEDPIN, LOW); // ONBOARD LED FOR DEBUGGING
  dxl.begin(1000000);
  //dxl.scan();
  dxl.setPortProtocolVersion(DXL_PROTOCOL_VERSION);
  dxl.ping(DXL_ID);
  dxl.torqueOff(DXL_ID);
  dxl.setOperatingMode(DXL_ID,OP_POSITION);
  dxl.writeControlTableItem(CW_COMPLIANCE_MARGIN, DXL_ID, 1);
  dxl.writeControlTableItem(CCW_COMPLIANCE_MARGIN, DXL_ID, 1);
  
  dxl.writeControlTableItem(RETURN_DELAY_TIME, DXL_ID, 0);
  dxl.torqueOn(DXL_ID);
  outmax = 20;
  outmin = -20;
  //myPID.SetOutputLimits(-60, 60);
  //myPID.SetMode(AUTOMATIC);
  starttime = micros();
  
  //delay(100);
  Can0.begin(); // BEGIN CAN0
  Can0.setBaudRate(1000000); // SET BAUDRATE
  Can0.setMaxMB(16); // SET MAX MAILBOX SIZE
  Can0.enableMBInterrupts(); // ENABLE CAN INTERRUPT ON
  Can0.onReceive(SetPoint); // LINK CAN INTERRUPT TO FUNCTION
  //delay(100);
  // Interval in microsecs
  //PIDTimer.priority(0);
  FeedbackTimer.begin(SendLog,FBFREQ);
  PIDTimer.begin(ExecuteCommand, PIDFREQ);
  //PIDTimer.priority(82);
  
  //delay(100);
  
  //delay(100);
  
  //delay(100);
  //Serial.println(dxl.getPresentPosition(DXL_ID, UNIT_DEGREE));
}

void loop() {
  Can0.events();// PUSHES CAN INTERRUPT FRAMES 
  //SendLog();
  //Serial.print("Hello");
  
 
    
  
}
  
