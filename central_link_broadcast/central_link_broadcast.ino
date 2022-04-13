/*
  Columbia University ROAM LandSnake:
  Central Teensy with added PID/Dynamixel/Encoder Firmware Script
  Updated by Rich Gedney
  Last Updated November 11th, 2021

*/

// ******************************************GLOBAL VARIABLES***************************************************************************

int angle1;
int angle2;
int angle3;
int angle4;
int angle5;
int anglecount;

unsigned long ZERO_TIME = 0;
const uint LEDPIN = 13; // ONBOARD LED PIN FOR DEBUGGING

// ******************************************ROS PREPROCESSING*************************************************************************
#include "ros.h" // ROS HEADER FILE
#include "snake_demo/cmd_angles.h" // MSG IS float32[] angles
#include "snake_demo/feedback_angles.h" // MSG IS float32[] enc_angles, float32[] dxl_angles, and uint64 timestamp
ros::NodeHandle  central; // CREATES ROS NODE "CENTRAL"

snake_demo::cmd_angles cmd_angles; // COMMAND ANGLES WE SUBSCRIBE TO
snake_demo::feedback_angles feedback_angles; // FEEDBACK ANGLES WE PUBLISH

void rosCallback(const snake_demo::cmd_angles& cmd_angles); // CALLBACK FOR RECEIPT OF DATA THROUGH ROSSERIAL, DEFINED LATER

ros::Subscriber<snake_demo::cmd_angles> cmd_angle_topic("cmd_angle_topic", &rosCallback); // LISTENING FOR CMD ANGLES TO RELAY TO DXL

ros::Publisher feedback_angle_topic("feedback_angle_topic", &feedback_angles); // LISTENING FOR CMD ANGLES TO RELAY TO DXL


// ******************************************CAN PREPROCESSING***************************************************************************
#include <FlexCAN_T4.h> // CAN HEADER FILE
FlexCAN_T4<CAN1, RX_SIZE_256, TX_SIZE_16> Can0; // CREATING CAN0 FOR USE

CAN_message_t cmd_msg;


// ******************************************INTERRUPT PREPROCESSING***************************************************************************


int SETANGLEFREQ = 10000; 
int FBFREQ = 1500; //~ (750 Hz Max: 1300 us)
int CANFREQ = 100; //10kHz
int SPINONCEFREQ = 100; //10kHz

IntervalTimer angletimer;
IntervalTimer CANTimer;
IntervalTimer ROSFeedbackTimer;
IntervalTimer SpinOnceTimer;

void rosCallback(const snake_demo::cmd_angles& cmd_angles) {
  angle1 = cmd_angles.angle1;
  angle2 = cmd_angles.angle2;
  angle3 = cmd_angles.angle3;
  angle4 = cmd_angles.angle4;
  angle5 = cmd_angles.angle5;
}

void setup()
{

  angle1 = 0; //start dynamixel pointing forward
  angle2 = 0;
  angle3 = 0;
  angle4 = 0;
  angle5 = 0;
  
  anglecount = 0;

  central.getHardware()->setBaud(57600); // SET BAUD RATE
  central.initNode(); // INITS NODE
  central.subscribe(cmd_angle_topic); // SUBSCRIBES TO SUB
  central.advertise(feedback_angle_topic); // SETS LOG ANGLE TOPIC TO PUBLISH
  central.negotiateTopics(); // ROS TOPIC MONITORING
  central.spinOnce();

  pinMode(6, OUTPUT); digitalWrite(6, LOW); // CAN TRANSCEIVER ENABLE

  pinMode(LEDPIN, OUTPUT);
  //  Serial.begin(115200);
  Can0.begin(); // BEGIN CAN0
  Can0.setBaudRate(1000000); //115200 SET BAUDRATE
  Can0.setMaxMB(16); // SET MAX MAILBOX SIZE
  Can0.enableMBInterrupts(); // ENABLE CAN INTERRUPT ON
  Can0.setMBFilter(MB0, 0); //set to only Rx from peripherals
  Can0.enhanceFilter(MB0);
  Can0.setClock(CLK_60MHz);
  Can0.onReceive(MB0, UpdateFeedbackArray);
  angletimer.begin(setnextAngle, SETANGLEFREQ);
  CANTimer.begin(CAN, CANFREQ);
  ROSFeedbackTimer.begin(SendFeedbackToROS, FBFREQ);
  SpinOnceTimer.begin(spinOnce, SPINONCEFREQ);
  ZERO_TIME = micros(); // SETS ZERO TIME AT START OF EPOCH

}

void CAN() {
  Can0.events();
}

void spinOnce(){
  central.spinOnce();
}

void UpdateFeedbackArray(const CAN_message_t &fb_msg) {
  if (fb_msg.id == 0) {
    volatile int i = (int) fb_msg.buf[0];
    volatile int enc_angle = fb_msg.buf[1] - 256 * fb_msg.buf[5]; // last term for sign correction
    volatile int dxl_angle = fb_msg.buf[2] - 256 * fb_msg.buf[6];

    switch (i) {
      case 1:
        feedback_angles.enc_angle1 = enc_angle;
        feedback_angles.dxl_angle1 = dxl_angle;
        break;
      case 2:
        feedback_angles.enc_angle2 = enc_angle;
        feedback_angles.dxl_angle2 = dxl_angle;
        break;
      case 3:
        feedback_angles.enc_angle3 = enc_angle;
        feedback_angles.dxl_angle3 = dxl_angle;
        break;
    }

  }

}

void SendFeedbackToROS() {
  feedback_angles.timestamp = float(micros() - ZERO_TIME); // TIMESTAMPING DATA
  feedback_angle_topic.publish(&feedback_angles);
}

void setnextAngle() {

    cmd_msg.id = 1;
    cmd_msg.buf[1] = trunc(angle1)+150;
    cmd_msg.buf[2] = trunc(angle2)+150;
    cmd_msg.buf[3] = trunc(angle3)+150;
    cmd_msg.buf[4] = trunc(angle4)+150;
    cmd_msg.buf[5] = trunc(angle5)+150;
    Can0.write(cmd_msg);
      
}

void loop() {

}
