#include<Dynamixel2Arduino.h> // DXL COMMS HEADER FILE
#include<TeensyThreads.h>
const uint8_t DXL_ID = 1, DXL_DIR_PIN = 2; // DXL MOTOR ID AND DIRECTION
const float DXL_PROTOCOL_VERSION = 1.0; // DXL COMM PROTOCOL
using namespace ControlTableItem; // DXL CONTROL TABLE
#define DXL_SERIAL Serial1 // SERIAL COMMSf
#define DEBUG_SERIAL Serial // DEBUG SERIAL (NOT NEEDED)
#include <FlexCAN_T4.h> // CAN COMMUNICATION HEADER FILE


//*******************************************************************************FUNCTION DECLARATIONS, VARIABLES, OBJECTS*****************************************************************************

// HARDWARE RELATED
const uint Encoder_pin = 19; // ENCODER PINOUT
const uint LINKID = 3; // LINK ID
unsigned int encoded_angle;
volatile float dxlangle = 150;
volatile float dxl_angle_read;
volatile bool updated;

IntervalTimer FeedbackTimerDxl;
IntervalTimer FeedbackTimerEnc;
IntervalTimer SendFeedback;
IntervalTimer WriteAngle;
IntervalTimer CANTimer;

FlexCAN_T4<CAN1, RX_SIZE_256, TX_SIZE_16> Can0; // INIT CAN COMMUNICATION
CAN_message_t fb_msg;
Dynamixel2Arduino dxl(DXL_SERIAL, DXL_DIR_PIN); // DXL MOTOR OBJECT

void UpdateSetPoint(const CAN_message_t &cmd); // READS COMMAND FROM CAN, UPDATES SET POINT

unsigned int READ_DXL = 1400; //~700 Hz
unsigned int READ_ENC = 1400; //~700 Hz
unsigned int WRITE_DXL = 1400; //~700 Hz
unsigned int FBTOCENTRAL = 1400; //~700 Hz

void setup() {
  updated = false;

  pinMode(6, OUTPUT); digitalWrite(6, LOW); // CAN TRANSCEIVER ENABLE
  dxl.begin(1000000); // BEGIN DYNAMIXEL AT BAUD RATE
  dxl.setPortProtocolVersion(DXL_PROTOCOL_VERSION);
  dxl.ping(DXL_ID);
  dxl.torqueOff(DXL_ID);
  dxl.setOperatingMode(DXL_ID, OP_POSITION);
  dxl.writeControlTableItem(CW_COMPLIANCE_MARGIN, DXL_ID, 1);
  dxl.writeControlTableItem(CCW_COMPLIANCE_MARGIN, DXL_ID, 1);
  dxl.writeControlTableItem(RETURN_DELAY_TIME, DXL_ID, 0);
  dxl.torqueOn(DXL_ID);
  Can0.begin(); // BEGIN CAN0
  Can0.setBaudRate(1000000); // SET BAUDRATE
  Can0.setMaxMB(16); // SET MAX MAILBOX SIZE... COULD BE USEFUL TO PLAY WITH THIS?
  Can0.setMBFilter(MB0, 1); //SET FILTER TO ONLY Rx FROM CENTRAL
  Can0.enhanceFilter(MB0);
  Can0.enableMBInterrupts(); // ENABLE CAN INTERRUPT ON
  Can0.setClock(CLK_60MHz);
  Can0.onReceive(MB0,rxAngle);
  FeedbackTimerDxl.begin(read_DXL, READ_DXL);
  FeedbackTimerEnc.begin(read_ENC, READ_ENC); 
  WriteAngle.begin(write_DXL, WRITE_DXL);
  SendFeedback.begin(sendFeedback, FBTOCENTRAL);
  
}

void CAN(){ //update CAN
  Can0.events();
}

void rxAngle(const CAN_message_t &cmd) { //recieved angle from central over CAN
  encoded_angle = (int) cmd.buf[LINKID];
  dxlangle = (((float) encoded_angle * 120)/255) - 60 + 150; //scale the angle back into range, and add 150 to calibrate to dxls
  fb_msg.buf[5] = encoded_angle;
}

void read_ENC() { //read the encoder and write angle to DXL (if new one has been recv'd)
  volatile float enc_angle_read = ((90 * (float) analogRead(Encoder_pin) / 1024) - 45) * -1;
  //map angles between 0 and 65535 for angles -60 to 60 deg (2 bytes worth of information)
  unsigned short enc_angle_mapped = (unsigned short) ((enc_angle_read + 60) * (65535)/120);
  unsigned char c1 = enc_angle_mapped & 0xFF;
  unsigned char c2 = enc_angle_mapped >> 8;
  fb_msg.buf[1] = c1;
  fb_msg.buf[2] = c2;

}

void write_DXL(){
    dxl.setGoalPosition(DXL_ID, (dxl_angle_read+150) + (dxlangle-(dxl_angle_read+150))*0.6 ,UNIT_DEGREE);
}


void read_DXL() { //read dynamixel angle
  dxl_angle_read = (float) dxl.getPresentPosition(DXL_ID, UNIT_DEGREE) - 150; //PRESENT POSITION OF DXL
  //map angles between 0 and 65535 for angles -60 to 60 deg (2 bytes worth of info)
  unsigned short dxl_angle_mapped = (unsigned short) ((dxl_angle_read + 60) * (65535)/120);
  unsigned char c1 = dxl_angle_mapped & 0xFF;
  unsigned char c2 = dxl_angle_mapped >> 8;
  fb_msg.buf[3] = c1;
  fb_msg.buf[4] = c2;
  

}

void sendFeedback(){ //send feedback angles over CAN to central
  fb_msg.id = 0;
  fb_msg.buf[0] = LINKID;
  Can0.write(fb_msg);
}



void loop() {

}
