/*
Columbia University ROAM Lab LandSnake: 
Central Teensy Firmware Script
Written by Rich Gedney
Last Updated June 14, 2021

Overview:
The main libraries are FlexCAN_T4, TeensyTimerInterrupt, and Teensy_ISR_Timer.
FlexCAN_T4 is used for controller area network (CAN) communication via the LandSnake's shield board
and CAN transceiver. The CAN bus is used both to receive feedback data from each of the link Teensys, and
to relay command angles from the roscore to the link Teensys for control. Receipt of data on the CAN is interrupt enabled 
to trigger the UpdateFeedbackArray callback function.

The TimerInterrupt and ISR_Timer functions work together to provide hardware timing for the execution of 
the SendFeedbackToROS function, which periodically publishes link angle feedback to a ROS node.

Usage Notes:
- When implementing this code on hardware, be sure to update the LINKID variable to the correct index
- When adjusting feedback/control rates, do so by specifying TIMER0_INTERVAL_MS and TIMER1_INTERVAL_MS;
  1L is the period of the interrupt, meaning that 1L is 1 kHz, 5L is .2 kHz, etc...
- Future code will feature some 

*/

// ******************************************GLOBAL VARIABLES***************************************************************************
const uint LEDPIN = 13; // ONBOARD LED PIN FOR DEBUGGING
const uint NLINKS = 1; // NUMBER OF LINKS IN SNAKE
unsigned long ZERO_TIME = 0; // WILL EVENTUALLY BE CALLED AT START OF EPOCH IN MICROS
unsigned int FBFREQ = 1000000; // PERIOD OF FEEDBACK TIMING

// ******************************************ROS PREPROCESSING*************************************************************************
#include "ros.h" // ROS HEADER FILE
#include "snake_demo/cmd_angles.h" // MSG IS float32[] angles
#include "snake_demo/feedback_angles.h" // MSG IS float32[] sea_angles, float32[] dxl_angles, and uint64 timestamp
ros::NodeHandle  central; // CREATES ROS NODE "CENTRAL"

snake_demo::cmd_angles cmd_angles; // COMMAND ANGLES WE SUBSCRIBE TO
snake_demo::feedback_angles feedback_angles; // FEEDBACK ANGLES WE PUBLISH

void rosCallback(const snake_demo::cmd_angles& cmd_angles); // CALLBACK FOR RECEIPT OF DATA THROUGH ROSSERIAL, DEFINED LATER

ros::Subscriber<snake_demo::cmd_angles> cmd_angle_topic("cmd_angle_topic", &rosCallback); // LISTENING FOR CMD ANGLES TO RELAY TO DXL

ros::Publisher feedback_angle_topic("feedback_angle_topic",&feedback_angles); // PUSHING BACK ANGLES TO BE LOGGED ON LAPTOP

// ******************************************CAN PREPROCESSING***************************************************************************
#include <FlexCAN_T4.h> // CAN HEADER FILE
FlexCAN_T4<CAN1, RX_SIZE_16, TX_SIZE_16> Can0; // CREATING CAN0 FOR USE

// ******************************************INTERRUPT PREPROCESSING***************************************************************************
IntervalTimer FeedbackTimer;

void SendFeedbackToROS()
{
  // THIS ARRAY PUBLISHES CMD_ANGLES TO ROS AT A FIXED RATE, INCLUDING THE LATEST TIMESTAMP EACH TIME
  // NO NEED TO UPDATE LOG_ANGLES HERE; THAT WILL BE DONE ON THE CAN INTERRUPT
  // LOG_ANGLES 
  feedback_angles.timestamp = float(micros()-ZERO_TIME); // TIMESTAMPING DATA
  feedback_angle_topic.publish(&feedback_angles); // SENDING TO ROS FOR LOGGING
}

void rosCallback(const snake_demo::cmd_angles& cmd_angles){
  // IN NORMAL OPERATION, THIS WOULD ENCODE AND RELAY ALL OF THE COMMANDS TO LINKS
  // FOR EACH IN THE SET OF ANGLES SENT:
  /*
  for(uint8_t i=1;i<NLINKS+1;i++) {
    CAN_message_t cmd_msg; // CREATES MESSAGE
    cmd_msg.id = i; // DESTINATION LINK ID 
    cmd_msg.buf[0] = 0; // ORIGIN LINK ID
    cmd_msg.buf[i] = int(cmd_angles.angles[i]); //STILL NEED TO FIGURE OUT ENCODING ON THIS END
    Can0.write(cmd_msg);
   */
   CAN_message_t cmd_msg;
   cmd_msg.id = 1; cmd_msg.buf[0]=0;cmd_msg.buf[1]=int(cmd_angles.angle1);
   cmd_msg.id = 2; cmd_msg.buf[0]=0;cmd_msg.buf[1]=int(cmd_angles.angle2);
   cmd_msg.id = 3; cmd_msg.buf[0]=0;cmd_msg.buf[1]=int(cmd_angles.angle3);
   cmd_msg.id = 4; cmd_msg.buf[0]=0;cmd_msg.buf[1]=int(cmd_angles.angle4);
   cmd_msg.id = 5; cmd_msg.buf[0]=0;cmd_msg.buf[1]=int(cmd_angles.angle5);

}

void UpdateFeedbackArray(const CAN_message_t &fb_msg) {
  /* NEED TO SPECIFY ENCODING RULES. THUS FAR, I HAVE:
  / MSG.ID IS THE DESTINATION LINK
  / MSG.BUF[0] IS THE ORIGIN LINK
  / WHAT DOES THE REST OF THE BUF LOOK LIKE?
  / EVENTUALLY, THIS FUNCTION SHOULD RECEIVE A CAN MESSAGE AND UPDATE
  / LOG_ANGLES ACCORDINGLY.
  / 
  / DXL ANGLES WILL BE IN THE NTH POSITION IN ARRAY.
  / SEA ANGLES WILL BE IN THE 2*NTH POSITION IN ARRAY.
  / 0TH POSITION IS RESERVED FOR TIMESTAMP.
  */
  
  // DECODING FUNCTION, COURTESY OF SETH!
  if(fb_msg.id == 0){
    float sea_angle = fb_msg.buf[1]|(fb_msg.buf[2]<<8);
    float dxl_angle = fb_msg.buf[3]|(fb_msg.buf[4]<<8);
    int i = (int)fb_msg.buf[0];
    switch(i){
      case 1: 
        feedback_angles.sea_angle1 = sea_angle; feedback_angles.dxl_angle1 = dxl_angle;
      case 2: 
        feedback_angles.sea_angle2 = sea_angle; feedback_angles.dxl_angle2 = dxl_angle;
      case 3: 
        feedback_angles.sea_angle3 = sea_angle; feedback_angles.dxl_angle3 = dxl_angle;
      case 4: 
        feedback_angles.sea_angle4 = sea_angle; feedback_angles.dxl_angle4 = dxl_angle;
      case 5: 
        feedback_angles.sea_angle5 = sea_angle; feedback_angles.dxl_angle5 = dxl_angle;
    }
    
    
  }
}

void setup()
{ 
  //Serial.begin(115200);
  central.getHardware()->setBaud(57600);
  central.initNode(); // INITS NODE
  central.subscribe(cmd_angle_topic); // SUBSCRIBES TO SUB
  central.advertise(feedback_angle_topic); // SETS LOG ANGLE TOPIC TO PUBLISH
  central.negotiateTopics(); // ROS TOPIC MONITORING
  central.spinOnce(); 
  delay(100);
  pinMode(6, OUTPUT); digitalWrite(6, LOW); // CAN TRANSCEIVER ENABLE
  pinMode(LEDPIN, OUTPUT); digitalWrite(LEDPIN, LOW); // ONBOARD LED FOR DEBUGGING
  delay(100);
  Can0.begin(); // BEGIN CAN0
  delay(100);
  Can0.setBaudRate(125000); // SET BAUDRATE
  Can0.setMaxMB(16); // SET MAX MAILBOX SIZE
  Can0.enableMBInterrupts(); // ENABLE CAN INTERRUPT ON
  Can0.onReceive(UpdateFeedbackArray); // LINK CAN INTERRUPT TO FUNCTION
  delay(100);
  FeedbackTimer.begin(SendFeedbackToROS,FBFREQ);
  delay(100);
  ZERO_TIME=micros(); // SETS ZERO TIME AT START OF EPOCH
  delay(100);
}

void loop()
{  central.spinOnce(); Can0.events(); } // REFRESHES ROS, NEGOTIATES INTERRUPT FRAMES
