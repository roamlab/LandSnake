/*
Columbia University ROAM Lab LandSnake: 
Link Teensy Firmware Script
Written by Rich Gedney
Last Updated June 11, 2021

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
const uint LINKID = 1; // LINK ID

/*
void AngleToBuf(float sea_angle,float dxl_angle) 
{ // ANGLE ENCODING FUNCTION, COURTESY OF SETH! SETS BUF TO BE SENT ON CAN
  fb_msg.id = 0; // SETS DESTINATION OF MESSAGE TO CENTRAL
  fb_msg.buf[0] = LINKID; // ID OF ORIGIN LINK
  int sea_first_half = (int)sea_angle & 255; int sea_second_half = (int)sea_angle>>8; // ENCODING SEA
  int dxl_first_half = (int)dxl_angle & 255; int dxl_second_half = (int)dxl_angle>>8; // ENCODING DXL
  fb_msg.buf[1]=sea_first_half;fb_msg.buf[2]=sea_second_half; // WRITING TO fb_msg
  fb_msg.buf[3]=dxl_first_half;fb_msg.buf[4]=dxl_second_half; // WRITING TO fb_msg
  for(int i = 5; i<8; i++) fb_msg.buf[i] = 0; // CLEARING SUBSEQUENT POSITIONS 
}*/

void SendLog()  
{
  // IN FINAL VERSION, THIS SHOULD:
  // A) READ DXL AND EXTERNAL ENCODER
  // B) WRITE BOTH ANGLES TO A CAN MESSAGE
  // C) PUBLISH THAT MESSAGE TO MAILBOX 0
  // NEED VARIABLES SEA_ANGLE AND DXL_ANGLE!
  float sea_angle=random(30.),dxl_angle=random(30.);
  fb_msg.id = 0; // SETS DESTINATION OF MESSAGE TO CENTRAL
  fb_msg.buf[0] = LINKID; // ID OF ORIGIN LINK
  int sea_first_half = (int)sea_angle & 255; int sea_second_half = (int)sea_angle>>8; // ENCODING SEA
  int dxl_first_half = (int)dxl_angle & 255; int dxl_second_half = (int)dxl_angle>>8; // ENCODING DXL
  fb_msg.buf[1]=sea_first_half;fb_msg.buf[2]=sea_second_half; // WRITING TO fb_msg
  fb_msg.buf[3]=dxl_first_half;fb_msg.buf[4]=dxl_second_half; // WRITING TO fb_msg
  for(int i = 5; i<8; i++) fb_msg.buf[i] = 0; // CLEARING SUBSEQUENT POSITIONS 
  //AngleToBuf(sea_angle,dxl_angle);  
  Can0.write(fb_msg);
  
  
  /* TIMING TEST
  dtime=micros();
  int delta=dtime-stime;
  Serial.print(delta); // CURRENTLY SHOWS TIME ELAPSED BETWEEN INTERRUPTS
  Serial.println(" microseconds elapsed!"); 
  stime=dtime;*/
}

void PID(){
  //Serial.println("POW");
}

void ExecuteCommand(const CAN_message_t &cmd) {
  if(cmd.id==LINKID){
     // FILL WITH TEENSY CMD/CONTROL LOGIC
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
}

void loop() { Can0.events(); }// PUSHES CAN INTERRUPT FRAMES 
