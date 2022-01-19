/*
Columbia University ROAM LandSnake: 
Central Teensy with added PID/Dynamixel/Encoder Firmware Script
Updated by Rich Gedney
Last Updated November 11th, 2021

*/

// ******************************************GLOBAL VARIABLES***************************************************************************
const uint LEDPIN = 13; // ONBOARD LED PIN FOR DEBUGGING
const uint NLINKS = 1; // NUMBER OF LINKS IN SNAKE
unsigned long ZERO_TIME = 0; // WILL EVENTUALLY BE CALLED AT START OF EPOCH IN MICROS
unsigned int FBFREQ = 10000; // PERIOD OF FEEDBACK TIMING
unsigned int CANFREQ = 950;
int this_ang, sec_ang, third_ang, fourth_ang, fifth_ang;

// ******************************************ROS PREPROCESSING*************************************************************************
#include "ros.h" // ROS HEADER FILE
#include "snake_demo/cmd_angles.h" // MSG IS float32[] angles
#include "snake_demo/feedback_angles.h" // MSG IS float32[] enc_angles, float32[] dxl_angles, and uint64 timestamp
ros::NodeHandle  central; // CREATES ROS NODE "CENTRAL"

snake_demo::cmd_angles cmd_angles; // COMMAND ANGLES WE SUBSCRIBE TO
snake_demo::feedback_angles feedback_angles; // FEEDBACK ANGLES WE PUBLISH

void rosCallback(const snake_demo::cmd_angles& cmd_angles); // CALLBACK FOR RECEIPT OF DATA THROUGH ROSSERIAL, DEFINED LATER

ros::Subscriber<snake_demo::cmd_angles> cmd_angle_topic("cmd_angle_topic", &rosCallback); // LISTENING FOR CMD ANGLES TO RELAY TO DXL

ros::Publisher feedback_angle_topic("feedback_angle_topic",&feedback_angles); // PUSHING BACK ANGLES TO BE LOGGED ON LAPTOP

// ******************************************CAN PREPROCESSING***************************************************************************
#include <FlexCAN_T4.h> // CAN HEADER FILE
FlexCAN_T4<CAN1, RX_SIZE_256, TX_SIZE_16> Can0; // CREATING CAN0 FOR USE

// ******************************************INTERRUPT PREPROCESSING***************************************************************************
IntervalTimer FeedbackTimer;
IntervalTimer CANTimer;

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
  // FOR EACH IN THE SET OF ANGLES SENT: MSG.ID IS DESTINATION, BUF0 IS ORIGIN, BUF1:2 IS ENCODED ANGLE, FILL AND WRITE
   CAN_message_t cmd_msg;
   cmd_msg.id=1;
   cmd_msg.buf[0]=0;
   if(cmd_angles.angle1<0){
    cmd_msg.buf[3] = 1;
    this_ang = cmd_angles.angle1*(-100);
    }
   else{this_ang = cmd_angles.angle1*100;cmd_msg.buf[3] = 0;}//10*100=1000}
   
   cmd_msg.buf[1]=(int)this_ang/100;//1000/10=10
   cmd_msg.buf[2]=(int)this_ang%100;//1000%10=0
   for(int i = 4; i<8; i++) cmd_msg.buf[i] = 0;
   Can0.write(cmd_msg);
   
   cmd_msg.id=2;
   cmd_msg.buf[0]=0;
   if(cmd_angles.angle2<0){
    cmd_msg.buf[3] = 1;
    sec_ang = cmd_angles.angle2*(-100);
    }
   else{sec_ang = cmd_angles.angle2*100;cmd_msg.buf[3] = 0;}//10*100=1000}
   
   cmd_msg.buf[1]=(int)sec_ang/100;
   cmd_msg.buf[2]=(int)sec_ang%100;
   for(int i = 4; i<8; i++) cmd_msg.buf[i] = 0;
   Can0.write(cmd_msg);

   cmd_msg.id=3;
   cmd_msg.buf[0]=0;
   if(cmd_angles.angle3<0){
    cmd_msg.buf[3] = 1;
    third_ang = cmd_angles.angle3*(-100);
    }
   else{third_ang = cmd_angles.angle3*100;cmd_msg.buf[3] = 0;}//10*100=1000}
   cmd_msg.buf[1]=(int)third_ang/100;
   cmd_msg.buf[2]=(int)third_ang%100;
   for(int i = 4; i<8; i++) cmd_msg.buf[i] = 0;
   Can0.write(cmd_msg);

   cmd_msg.id=4;
   cmd_msg.buf[0]=0;
   if(cmd_angles.angle4<0){
    cmd_msg.buf[3] = 1;
    fourth_ang = cmd_angles.angle4*(-100);
    }
   else{fourth_ang = cmd_angles.angle4*100;cmd_msg.buf[3] = 0;}//10*100=1000}
   cmd_msg.buf[1]=(int)fourth_ang/100;
   cmd_msg.buf[2]=(int)fourth_ang%100;
   for(int i = 4; i<8; i++) cmd_msg.buf[i] = 0;
   Can0.write(cmd_msg);

   cmd_msg.id=5;
   cmd_msg.buf[0]=0;
   if(cmd_angles.angle5<0){
    cmd_msg.buf[3] = 1;
    fifth_ang = cmd_angles.angle5*(-100);
    }
   else{fifth_ang = cmd_angles.angle5*100;cmd_msg.buf[3] = 0;}//10*100=1000}
   cmd_msg.buf[1]=(int)fifth_ang/100;
   cmd_msg.buf[2]=(int)fifth_ang%100;
   for(int i = 4; i<8; i++) cmd_msg.buf[i] = 0;
   Can0.write(cmd_msg);
   
}

void UpdateFeedbackArray(const CAN_message_t &fb_msg) {
  // DECODING FUNCTION, COURTESY OF SETH!
  if(fb_msg.id == 0){
    float enc_angle = (fb_msg.buf[1]*100 + fb_msg.buf[2])/100.0;
    if(fb_msg.buf[5]==1){enc_angle*=-1;}
    float dxl_angle = fb_msg.buf[3]|(fb_msg.buf[4]<<8);
    int i = (int)fb_msg.buf[0];
    switch(i){
      case 1: 
        feedback_angles.enc_angle1 = enc_angle;
        //Serial.println(enc_angle);
        feedback_angles.dxl_angle1 = dxl_angle; break;
      case 2: 
        feedback_angles.enc_angle2 = enc_angle; feedback_angles.dxl_angle2 = dxl_angle; break;
      case 3: 
        feedback_angles.enc_angle3 = enc_angle; feedback_angles.dxl_angle3 = dxl_angle; break;
      case 4: 
        feedback_angles.enc_angle4 = enc_angle; feedback_angles.dxl_angle4 = dxl_angle; break;
      case 5: 
        feedback_angles.enc_angle5 = enc_angle; feedback_angles.dxl_angle5 = dxl_angle; break;
    }
    
    
  }
}

void setup()
{ 
  //Serial.begin(115200);
  central.getHardware()->setBaud(57600); // SET BAUD RATE
  central.initNode(); // INITS NODE
  central.subscribe(cmd_angle_topic); // SUBSCRIBES TO SUB
  central.advertise(feedback_angle_topic); // SETS LOG ANGLE TOPIC TO PUBLISH
  central.negotiateTopics(); // ROS TOPIC MONITORING
  central.spinOnce(); 
  //delay(100);
  pinMode(6, OUTPUT); digitalWrite(6, LOW); // CAN TRANSCEIVER ENABLE
  //pinMode(LEDPIN, OUTPUT); digitalWrite(LEDPIN, LOW); // ONBOARD LED FOR DEBUGGING
  //delay(100);
  Can0.begin(); // BEGIN CAN0
  //delay(100);
  Can0.setBaudRate(1000000); //115200 SET BAUDRATE
  Can0.setMaxMB(16); // SET MAX MAILBOX SIZE
  Can0.enableMBInterrupts(); // ENABLE CAN INTERRUPT ON
  Can0.setMBFilter(MB0,0);
  Can0.enhanceFilter(MB0);
  Can0.onReceive(MB0,UpdateFeedbackArray); // LINK CAN INTERRUPT TO FUNCTION
  //delay(100);
  CANTimer.begin(CAN,CANFREQ);
  FeedbackTimer.begin(SendFeedbackToROS,FBFREQ);
  //delay(100);
  ZERO_TIME=micros(); // SETS ZERO TIME AT START OF EPOCH
  //delay(100);
}

void CAN(){
  
  central.spinOnce();
  Can0.events();
  }

void loop(){  
  
  //central.spinOnce();
  //Can0.events();


  
} // REFRESHES ROS, NEGOTIATES INTERRUPT FRAMES
