#include<Dynamixel2Arduino.h> // DXL COMMS HEADER FILE
#include<TeensyThreads.h>
const uint8_t DXL_ID = 1, DXL_DIR_PIN = 2; // DXL MOTOR ID AND DIRECTION
const float DXL_PROTOCOL_VERSION = 1.0; // DXL COMM PROTOCOL
using namespace ControlTableItem; // DXL CONTROL TABLE
#define DXL_SERIAL Serial1 // SERIAL COMMSf
#define DEBUG_SERIAL Serial // DEBUG SERIAL (NOT NEEDED)
#include <FlexCAN_T4.h> // CAN COMMUNICATION HEADER FILE




float angle1;
float angle2;
float angle3;
float angle4;
float angle5;
int anglecount;
float enc_angle_read;

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

//*******************************************************************************FUNCTION DECLARATIONS, VARIABLES, OBJECTS*****************************************************************************

// HARDWARE RELATED
const uint Encoder_pin = 19; // ENCODER PINOUT
const uint LINKID = 1; // LINK ID
unsigned int encoded_angle;
volatile float dxlangle = 150;
volatile float dxl_angle_read;
int poll_count;
volatile bool updated;

IntervalTimer FeedbackTimerEnc;
IntervalTimer FeedbackTimerDxl;
IntervalTimer WriteAngle;
IntervalTimer ROSFeedbackTimer;
IntervalTimer SpinOnceTimer;

FlexCAN_T4<CAN1, RX_SIZE_256, TX_SIZE_16> Can0; // INIT CAN COMMUNICATION
CAN_message_t fb_msg;
Dynamixel2Arduino dxl(DXL_SERIAL, DXL_DIR_PIN); // DXL MOTOR OBJECT

void UpdateSetPoint(const CAN_message_t &cmd); // READS COMMAND FROM CAN, UPDATES SET POINT

unsigned int READ_DXL = 1400; //~700 Hz
unsigned int READ_ENC = 1400; //~700 Hz
unsigned int WRITE_DXL = 1400; //~700 Hz
unsigned int FBTOCENTRAL = 1400; //~700 Hz
int SETANGLEFREQ = 10000; //100 Hz
int FBFREQ = 1400; //~700 Hz
int SPINONCEFREQ = 100; //10kHz

void setup() {
  updated = false;
  poll_count = 0;

  central.getHardware()->setBaud(57600); // SET BAUD RATE
  central.initNode(); // INITS NODE
  central.subscribe(cmd_angle_topic); // SUBSCRIBES TO SUB
  central.advertise(feedback_angle_topic); // SETS LOG ANGLE TOPIC TO PUBLISH
  central.negotiateTopics(); // ROS TOPIC MONITORING
  central.spinOnce();
  pinMode(6, OUTPUT); digitalWrite(6, LOW); // CAN TRANSCEIVER ENABLE
  dxl.begin(1000000); // BEGIN DYNAMIXEL AT BAUD RATE
  dxl.setPortProtocolVersion(DXL_PROTOCOL_VERSION);
  dxl.ping(DXL_ID);
  dxl.torqueOff(DXL_ID);
  dxl.setOperatingMode(DXL_ID, OP_POSITION);
  dxl.writeControlTableItem(CW_COMPLIANCE_MARGIN, DXL_ID, 1);
  dxl.writeControlTableItem(CCW_COMPLIANCE_MARGIN, DXL_ID, 1);
  dxl.writeControlTableItem(RETURN_DELAY_TIME, DXL_ID, 0);
  //dxl.torqueOn(DXL_ID);
  FeedbackTimerEnc.begin(read_ENC, READ_ENC);
  FeedbackTimerDxl.begin(read_DXL, READ_DXL); 
  ROSFeedbackTimer.begin(SendFeedbackToROS, FBFREQ);
  SpinOnceTimer.begin(spinOnce, SPINONCEFREQ);
  ZERO_TIME = micros(); // SETS ZERO TIME AT START OF EPOCH
  
}

void SendFeedbackToROS() { //send feedback angles over ROSSERIAL
  feedback_angles.timestamp = float(micros() - ZERO_TIME); // TIMESTAMPING DATA
  feedback_angles.enc_angle1 = enc_angle_read;
  feedback_angles.dxl_angle1 = dxl_angle_read;
  feedback_angles.cmd_angle1 = poll_count;
  feedback_angle_topic.publish(&feedback_angles);
}

void spinOnce(){ //refresh ROS
  central.spinOnce();
}

void rosCallback(const snake_demo::cmd_angles& cmd_angles) { //update command angle array
  angle1 = cmd_angles.angle1;
  updated = true;
  write_DXL();
}

void read_ENC() { //read the encoder (if new one has been recv'd)
  //enc_angle_read = analogRead(Encoder_pin);
  enc_angle_read = ((90 * (float) analogRead(Encoder_pin) / 1024) - 45) * -1;

}

void write_DXL(){
   if(updated){
    dxl.setGoalPosition(DXL_ID, angle1 + 150,UNIT_DEGREE);
    updated = false;
   }
}


void read_DXL() { //read dynamixel angle
  dxl_angle_read = ((float) dxl.getPresentPosition(DXL_ID, UNIT_DEGREE)) - 150; //PRESENT POSITION OF DXL
  poll_count++;
}



void loop() {

}
