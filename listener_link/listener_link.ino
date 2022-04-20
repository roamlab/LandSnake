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
volatile int dxlangle = 150;
volatile bool updated;

IntervalTimer FeedbackTimerDxl;
IntervalTimer FeedbackTimerEnc;
IntervalTimer SendFeedback;
IntervalTimer CANTimer;

FlexCAN_T4<CAN1, RX_SIZE_256, TX_SIZE_16> Can0; // INIT CAN COMMUNICATION
CAN_message_t fb_msg;
Dynamixel2Arduino dxl(DXL_SERIAL, DXL_DIR_PIN); // DXL MOTOR OBJECT

void UpdateSetPoint(const CAN_message_t &cmd); // READS COMMAND FROM CAN, UPDATES SET POINT

unsigned int READ_DXL = 1300; //~750 Hz
unsigned int READ_ENC_WRITE_DXL = 1300; //~750 Hz
unsigned int FBTOCENTRAL = 1300; //~750 Hz
unsigned int CANFREQ = 100; //10kHz

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
  CANTimer.begin(CAN, CANFREQ);
  FeedbackTimerDxl.begin(read_DXL, READ_DXL);
  FeedbackTimerEnc.begin(read_ENC_write_DXL, READ_ENC_WRITE_DXL); 
  SendFeedback.begin(sendFeedback, FBTOCENTRAL);
  
}

void CAN(){ //update CAN
  Can0.events();
}

void rxAngle(const CAN_message_t &cmd) { //recieved angle from central over CAN
  dxlangle = cmd.buf[LINKID];
  updated = true;
}

void read_ENC_write_DXL() { //read the encoder and write angle to DXL (if new one has been recv'd)
  volatile int enc_angle_read = trunc((90 * analogRead(Encoder_pin) / 1024) - 45) * -1;
  if(updated){
    dxl.setGoalPosition(DXL_ID, dxlangle,UNIT_DEGREE);
    updated = false;
  }
  fb_msg.buf[1] = enc_angle_read;
  if(enc_angle_read < 0){
    fb_msg.buf[5] = 1; //indicates negative
  } else{
    fb_msg.buf[5] = 0;
  }

}


void read_DXL() { //read dynamixel angle
  volatile int dxl_angle_read = trunc(dxl.getPresentPosition(DXL_ID, UNIT_DEGREE)) - 150; //PRESENT POSITION OF DXL
  fb_msg.buf[2] = dxl_angle_read;
  if(dxl_angle_read < 0){
    fb_msg.buf[6] = 1;
  } else{
    fb_msg.buf[6] = 0;
  }
  

}

void sendFeedback(){ //send feedback angles over CAN to central
  fb_msg.id = 0;
  fb_msg.buf[0] = LINKID;
  Can0.write(fb_msg);
}



void loop() {

}
