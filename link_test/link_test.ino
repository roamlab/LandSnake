/*
Columbia University ROAM Lab LandSnake: 
Link Teensy Firmware Script
Written by Rich Gedney
Last Updated June 26, 2021

Overview:
The main libraries are FlexCAN_T4, TeensyTimerInterrupt, and Teensy_ISR_Timer.
FlexCAN_T4 is used for controller area network (CAN) communication via the LandSnake's shield board
and CAN transceiver. The CAN bus is used both to receive motor commands from the central Teensy, and
to send feedback back to the central Teensy for logging. Receipt of data on the CAN is interrupt enabled 
to trigger the ExecuteCommand callback function.

The TimerInterrupt and ISR_Timer functions work together to provide hardware timing for the execution of 
the SendLog and PID functions. The SendLog function sends feedback to the central link, and the PID 
function sends motor commands through a controller and to the motor. 

Usage Notes:
- When implementing this code on hardware, be sure to update the LINKID variable to the correct index
- When adjusting feedback/control rates, do so by specifying TIMER0_INTERVAL_MS and TIMER1_INTERVAL_MS;
  1L is the period of the interrupt, meaning that 1L is 1 kHz, 5L is .2 kHz, etc...
- Future code will feature some 

*/

#include <Dynamixel2Arduino.h>
const uint8_t DXL_ID=1, DXL_DIR_PIN=2;
const float DXL_PROTOCOL_VERSION=1.0;
using namespace ControlTableItem;
#define DXL_SERIAL Serial1
Dynamixel2Arduino dxl(DXL_SERIAL,DXL_DIR_PIN);

#include <PID_v1.h>
const uint8_t Encoder_pin = 19;
double Setpoint, Input, Output;
double command_angle;
double test;
double maxKp = 0.15, maxKi = 0.15, maxKd = 0.015;
double Kp = 0.6, Ki = 0.2 , Kd = 0.0004;
PID myPID(&Input, &Output, &Setpoint, Kp, Ki, Kd, DIRECT);
unsigned int FBFREQ = 1000; // PERIOD OF FEEDBACK TIMING

#include <FlexCAN_T4.h>
FlexCAN_T4<CAN1, RX_SIZE_16, TX_SIZE_16> Can0; // INIT CAN COMMUNICATION TESTING

IntervalTimer FeedbackTimer;
CAN_message_t fb_msg; // FEEDBACK MESSAGE
// FUNCTIONS AND VARIABLES

void SendLog(); // THE REAL ISR: CONTAINS ALL LOGGING CODE
void executeCommand(const CAN_message_t &cmd); // CONTROLS DXL USING COMMANDS RECEIVED OVER CAN
void AngleToBuf(float angle); // MAKES AN ANGLE WRITEABLE TO A CAN BUF
const uint LEDPIN = 23; // ONBOARD LED PIN
const uint LINKID = 2; // LINK ID
float starting_position;


void SendLog()  
{
  float ext_angle=89*analogRead(Encoder_pin)/1024;
  float dxl_angle=dxl.getPresentPosition(DXL_ID, UNIT_DEGREE)-starting_position;
  fb_msg.id = 0; // SETS DESTINATION OF MESSAGE TO CENTRAL
  fb_msg.buf[0] = LINKID; // ID OF ORIGIN LINK
  int ext_first_half = (int)ext_angle & 255; int ext_second_half = (int)ext_angle>>8; // ENCODING EXT
  int dxl_first_half = (int)dxl_angle & 255; int dxl_second_half = (int)dxl_angle>>8; // ENCODING DXL
  fb_msg.buf[1]=ext_first_half;fb_msg.buf[2]=ext_second_half; // WRITING TO fb_msg
  fb_msg.buf[3]=dxl_first_half;fb_msg.buf[4]=dxl_second_half; // WRITING TO fb_msg
  for(int i = 5; i<8; i++) fb_msg.buf[i] = 0; // CLEARING SUBSEQUENT POSITIONS 
  Can0.write(fb_msg);
}

/*
void PID(){
  //Serial.println("POW");
}
*/

void ExecuteCommand(const CAN_message_t &cmd) {
  if(cmd.id==LINKID){
    float angle = cmd.buf[1]|(cmd.buf[2]<<8);
    test = 89 * (analogRead(Encoder_pin)) / 1024; //transfer to degree
    Setpoint = angle;
    Input = test;
    myPID.Compute();
    command_angle = Output;
    dxl.setGoalPosition(DXL_ID, dxl.getPresentPosition(DXL_ID, UNIT_DEGREE) - command_angle , UNIT_DEGREE);
  }
}

void setup(void) {
  //Serial.begin(115200); // SERIAL: CAN KILL THIS LATER
  pinMode(6, OUTPUT); digitalWrite(6, LOW); // CAN TRANSCEIVER ENABLE
  pinMode(LEDPIN, OUTPUT); digitalWrite(LEDPIN, LOW); // ONBOARD LED FOR DEBUGGING
  delay(100);
  Can0.begin(); // BEGIN CAN0
  Can0.setBaudRate(125000); // SET BAUDRATE
  Can0.setMaxMB(16); // SET MAX MAILBOX SIZE
  Can0.enableMBInterrupts(); // ENABLE CAN INTERRUPT ON
  Can0.onReceive(ExecuteCommand); // LINK CAN INTERRUPT TO FUNCTION
  delay(100);
  // Interval in microsecs
  FeedbackTimer.begin(SendLog,FBFREQ);
  delay(100);
  dxl.begin(1000000);
  dxl.scan();
  dxl.setPortProtocolVersion(DXL_PROTOCOL_VERSION);
  dxl.ping(DXL_ID);
  dxl.torqueOff(DXL_ID);
  dxl.setOperatingMode(DXL_ID,OP_POSITION);
  dxl.writeControlTableItem(CW_COMPLIANCE_MARGIN,DXL_ID,2);
  dxl.writeControlTableItem(CW_COMPLIANCE_MARGIN,DXL_ID,2);
  dxl.torqueOn(DXL_ID);
  delay(100);
  myPID.SetOutputLimits(-40, 40);
  myPID.SetMode(AUTOMATIC);
  delay(100);
  starting_position = dxl.getPresentPosition(DXL_ID, UNIT_DEGREE);
}

void loop() { Can0.events(); }// PUSHES CAN INTERRUPT FRAMES 
