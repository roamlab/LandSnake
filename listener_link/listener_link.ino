#include<Dynamixel2Arduino.h> // DXL COMMS HEADER FILE
#include<TeensyThreads.h>
#include "PMW.h"
const uint8_t DXL_ID = 1, DXL_DIR_PIN = 2; // DXL MOTOR ID AND DIRECTION
const float DXL_PROTOCOL_VERSION = 1.0; // DXL COMM PROTOCOL
using namespace ControlTableItem; // DXL CONTROL TABLE
#define DXL_SERIAL Serial1 // SERIAL COMMSf
#define DEBUG_SERIAL Serial // DEBUG SERIAL (NOT NEEDED)
#define NEUTRALPOS 150
#include <FlexCAN_T4.h> // CAN COMMUNICATION HEADER FILE


//*******************************************************************************FUNCTION DECLARATIONS, VARIABLES, OBJECTS*****************************************************************************

// HARDWARE RELATED
const uint Encoder_pin = 19; // ENCODER PINOUT
const uint LINKID = 3; // LINK ID
unsigned int encoded_angle;
volatile float dxlangle = NEUTRALPOS;
volatile float dxl_angle_read;
volatile float dxl_velocity_read;
volatile bool updated;

IntervalTimer FeedbackTimerDxl;
IntervalTimer FeedbackTimerEnc;
IntervalTimer SendFeedback;
IntervalTimer WriteAngle;

int FeedbackTimerDxlflag;
int FeedbackTimerEncflag;
int SendFeedbackflag;
int WriteAngleflag;
int rxAngleflag;

PMW pmw;

FlexCAN_T4<CAN1, RX_SIZE_256, TX_SIZE_16> Can0; // INIT CAN COMMUNICATION
CAN_message_t cmd;
CAN_message_t fb_msg_enc;
CAN_message_t fb_msg_dxl;
Dynamixel2Arduino dxl(DXL_SERIAL, DXL_DIR_PIN); // DXL MOTOR OBJECT

unsigned int READ_DXL = 1400; //~700 Hz
unsigned int READ_ENC = 1400; //~700 Hz
unsigned int WRITE_DXL = 1400; //~700 Hz
unsigned int FBTOCENTRAL = 1400; //~700 Hz

int xyvelocity[2];

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
  dxl.writeControlTableItem(CW_COMPLIANCE_SLOPE,DXL_ID, 128);
  dxl.writeControlTableItem(CCW_COMPLIANCE_SLOPE,DXL_ID, 128);
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
  SPI.begin();
  pmw.set_firmware(PMW3360_firmware_length, PMW3360_firmware_data);
  pmw.startup();
  
  FeedbackTimerDxlflag = 0;
  FeedbackTimerEncflag = 0;
  SendFeedbackflag = 0;
  WriteAngleflag = 0;
  rxAngleflag = 0;

}

void rxAngle(const CAN_message_t &cmd_msg) { //recieved angle from central over CAN
  memcpy(&cmd, &cmd_msg, sizeof(struct CAN_message_t));
  rxAngleflag = 1;
}

void read_ENC() { //read the encoder and write angle to DXL (if new one has been recv'd)
  FeedbackTimerEncflag = 1;
}

void write_DXL(){
  WriteAngleflag = 1;
}

void read_DXL() { //read dynamixel angle
  FeedbackTimerDxlflag = 1;
}

void sendFeedback(){ //send feedback angles over CAN to central
  SendFeedbackflag = 1;
}

void loop() {
  if(rxAngleflag){
    updated = true;
    encoded_angle = (int) cmd.buf[LINKID];
    dxlangle = (((float) encoded_angle * 120)/255) - 60 + NEUTRALPOS; //scale the angle back into range, and add NEUTRALPOS to calibrate to dxls
    rxAngleflag = 0;
  }
  if(WriteAngleflag){
    if(updated){
      dxl.setGoalPosition(DXL_ID, dxlangle ,UNIT_DEGREE);
      updated = false;
    }
    WriteAngleflag = 0;
  }
  if(SendFeedbackflag){
    fb_msg_enc.id = 0;
    fb_msg_enc.buf[0] = LINKID;
    fb_msg_enc.buf[7] = 0; //8th byte indicates which message (encoders or dynamixel)
    
    fb_msg_dxl.id = 0;
    fb_msg_dxl.buf[0] = LINKID;
    fb_msg_dxl.buf[7] = 1; //8th byte indicates which message (encoders or dynamixel)
    
    Can0.write(fb_msg_enc);
    Can0.write(fb_msg_dxl);

    SendFeedbackflag = 0;
  }
  if(FeedbackTimerEncflag){
    volatile float enc_angle_read = ((90 * (float) analogRead(Encoder_pin) / 1024) - 45) * -1;
    
    pmw.read_motion(xyvelocity);
    xyvelocity[0] = convTwosComp(xyvelocity[0]);
    xyvelocity[1] = convTwosComp(xyvelocity[1]);
    
    //take the lowest 16 bits of x velocity and y velocity
    unsigned char xv1 = xyvelocity[0] & 0xFF;
    unsigned char xv2 = (xyvelocity[0] >> 8) & 0xFF;
    unsigned char yv1 = xyvelocity[1] & 0xFF;
    unsigned char yv2 = (xyvelocity[1] >> 8) & 0xFF;

    fb_msg_enc.buf[3] = xv1;
    fb_msg_enc.buf[4] = xv2;
    fb_msg_enc.buf[5] = yv1;
    fb_msg_enc.buf[6] = yv2;
    
    //map angles between 0 and 65535 for angles -60 to 60 deg (2 bytes worth of information)
    unsigned short enc_angle_mapped = (unsigned short) ((enc_angle_read + 60) * (65535)/120);
    unsigned char c1 = enc_angle_mapped & 0xFF;
    unsigned char c2 = enc_angle_mapped >> 8;
    fb_msg_enc.buf[1] = c1;
    fb_msg_enc.buf[2] = c2;

    FeedbackTimerEncflag = 0;
  }
  if(FeedbackTimerDxlflag){
    dxl_angle_read = ((float) dxl.getPresentPosition(DXL_ID, UNIT_DEGREE)) - NEUTRALPOS; //PRESENT POSITION OF DXL manually offset by 4 deg
    //map angles between 0 and 65535 for angles -60 to 60 deg (2 bytes worth of info)
    unsigned short dxl_angle_mapped = (unsigned short) ((dxl_angle_read + 60) * (65535)/120);
    unsigned char c1 = dxl_angle_mapped & 0xFF;
    unsigned char c2 = dxl_angle_mapped >> 8;
    
    fb_msg_dxl.buf[1] = c1;
    fb_msg_dxl.buf[2] = c2;
    FeedbackTimerDxlflag = 0;
  }
}
