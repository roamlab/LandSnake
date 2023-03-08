/*
  Columbia University ROAM LandSnake:
  Central Teensy with added PID/Dynamixel/Encoder Firmware Script
  Updated by Rich Gedney
  Last Updated November 11th, 2021

*/

// ******************************************GLOBAL VARIABLES***************************************************************************
#define NLINKS 5
float angles[NLINKS];

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
CAN_message_t fb_msg;
// ******************************************INTERRUPT PREPROCESSING***************************************************************************


int SETANGLEFREQ = 10000; //100 Hz
int FBFREQ = 1400; //~700 Hz
int CANFREQ = 100; //10kHz
int SPINONCEFREQ = 100; //10kHz

IntervalTimer angletimer;
IntervalTimer CANTimer;
IntervalTimer ROSFeedbackTimer;
IntervalTimer SpinOnceTimer;

int angletimerflag;
int CANtimerflag;
int ROSFeedbackTimerflag;
int spinOnceTimerflag;
int rosCallbackflag;
int UpdateFeedbackArrayflag;

float offsetarr[10] = {0.9402618408203125,-0.35,0.6509513854980469,-1.55,0.9402618408203125,0}; //angle offsets for feedback

void rosCallback(const snake_demo::cmd_angles& cmd_angles) { //update command angle array
  angles[0] = cmd_angles.angle1;
  angles[1] = cmd_angles.angle2;
  angles[2] = cmd_angles.angle3;
  angles[3] = cmd_angles.angle4;
  angles[4] = cmd_angles.angle5;
}

void setup()
{
  //start dynamixel pointing forward
  
  angletimerflag = 0;
  CANtimerflag = 0;
  ROSFeedbackTimerflag = 0;
  spinOnceTimerflag = 0;
  rosCallbackflag = 0;
  UpdateFeedbackArrayflag = 0;

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

void CAN() { //update CAN
  CANtimerflag = 1;
}

void spinOnce(){ //refresh ROS
  spinOnceTimerflag = 1;
}

void UpdateFeedbackArray(const CAN_message_t &feedback) { //update feedback angle array
  memcpy(&fb_msg, &feedback, (int) sizeof(struct CAN_message_t));
  UpdateFeedbackArrayflag = 1;
}

void SendFeedbackToROS() { //send feedback angles over ROSSERIAL
  ROSFeedbackTimerflag = 1;
}

void setnextAngle() { //set flag to broadcast angles to all teensys
    angletimerflag = 1;
}

unsigned char convert_to_char(float angle){
  unsigned char angle_char = (char)((angle + 60)*255/120);
  return angle_char;
}

void send_command(){
  // convert commanded angles range of 0-256
  cmd_msg.id = 1;
  cmd_msg.buf[1] = (unsigned char) convert_to_char(angles[0]);
  cmd_msg.buf[2] = (unsigned char) convert_to_char(angles[1]);
  cmd_msg.buf[3] = (unsigned char) convert_to_char(angles[2]);
  cmd_msg.buf[4] = (unsigned char) convert_to_char(angles[3]);
  cmd_msg.buf[5] = (unsigned char) convert_to_char(angles[4]);
  // broadcast message
  Can0.write(cmd_msg);
}

void loop() {
  if(angletimerflag){
    // send command angles
    send_command();
    angletimerflag = 0;
  }
  if(CANtimerflag){
    Can0.events();
    CANtimerflag = 0;
  }
  if(ROSFeedbackTimerflag){
    feedback_angles.timestamp = float(micros() - ZERO_TIME); // TIMESTAMPING DATA
    feedback_angle_topic.publish(&feedback_angles);
    ROSFeedbackTimerflag = 0;
  }
  if(spinOnceTimerflag){
    central.spinOnce();
    spinOnceTimerflag = 0;
  }
  if(UpdateFeedbackArrayflag){
    int i = (int) fb_msg.buf[0];
    int msg_type = (int) fb_msg.buf[7];

    //encoder data
    unsigned short decoded_enc = ((unsigned short)fb_msg.buf[2]<<8)|fb_msg.buf[1];
    signed short decoded_xvel = ((signed short) fb_msg.buf[4]<<8)|fb_msg.buf[3];
    signed short decoded_yvel = ((signed short) fb_msg.buf[6]<<8)|fb_msg.buf[5];
    float enc_angle = (((float)decoded_enc*120)/65535) - 60 + offsetarr[2*(i-1) + 1]; //add adjustment

    //dynamixel data
    unsigned short decoded_dxl = ((unsigned short)fb_msg.buf[2]<<8)|fb_msg.buf[1];
    float dxl_angle = (((float)decoded_dxl*120)/65535) - 60 + offsetarr[2*(i-1)]; //add adjustment
    
    switch (i) {
      case 1:
        if(msg_type == 0){
          feedback_angles.enc_angle1 = enc_angle;
          feedback_angles.xvel1 = decoded_xvel;
          feedback_angles.yvel1 = decoded_yvel;
        } else if(msg_type == 1){
          feedback_angles.dxl_angle1 = dxl_angle;
        }
        break;
        
      case 2:
        if(msg_type == 0){
          feedback_angles.enc_angle2 = enc_angle;
          feedback_angles.xvel2 = decoded_xvel;
          feedback_angles.yvel2 = decoded_yvel;
        } else if(msg_type == 1){
          feedback_angles.dxl_angle2 = dxl_angle;
        }
        break;
        
      case 3:
        if(msg_type == 0){
          feedback_angles.enc_angle3 = enc_angle;
          feedback_angles.xvel3 = decoded_xvel;
          feedback_angles.yvel3 = decoded_yvel;
        } else if(msg_type == 1){
          feedback_angles.dxl_angle3 = dxl_angle;
        }
        break;
        
      case 4:
        if(msg_type == 0){
          feedback_angles.enc_angle4 = enc_angle;
          feedback_angles.xvel4 = decoded_xvel;
          feedback_angles.yvel4 = decoded_yvel;
        } else if(msg_type == 1){
          feedback_angles.dxl_angle4 = dxl_angle;
        }
        break;
    }
    
    UpdateFeedbackArrayflag = 0;
  }
}
