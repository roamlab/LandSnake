#include<Dynamixel2Arduino.h> // DXL COMMS HEADER FILE
const uint8_t DXL_ID=1, DXL_DIR_PIN=2; // DXL MOTOR ID AND DIRECTION
const float DXL_PROTOCOL_VERSION=1.0; // DXL COMM PROTOCOL
using namespace ControlTableItem; // DXL CONTROL TABLE
#define DXL_SERIAL Serial1 // SERIAL COMMSf
#define DEBUG_SERIAL Serial // DEBUG SERIAL (NOT NEEDED)
#include <FlexCAN_T4.h> // CAN COMMUNICATION HEADER FILE

//*******************************************************************************FUNCTION DECLARATIONS, VARIABLES, OBJECTS*****************************************************************************

// HARDWARE RELATED
const uint Encoder_pin = 19; // ENCODER PINOUT
const uint LINKID = 1; // LINK ID
volatile int dxlangle;
volatile bool updated;

IntervalTimer updateangle;
IntervalTimer FeedbackTimer;

FlexCAN_T4<CAN1, RX_SIZE_256, TX_SIZE_16> Can0; // INIT CAN COMMUNICATION
CAN_message_t cmd; // COMMAND MESSAGE
CAN_message_t fb_msg;
Dynamixel2Arduino dxl(DXL_SERIAL,DXL_DIR_PIN); // DXL MOTOR OBJECT

void UpdateSetPoint(const CAN_message_t &cmd); // READS COMMAND FROM CAN, UPDATES SET POINT

unsigned int PIDPERIOD_US = 5000;// PERIOD OF PID TIMING
//unsigned int FB_PERIOD_US = 10000;

void setup() {
  
  Serial.begin(115200);
  pinMode(6, OUTPUT); digitalWrite(6, LOW); // CAN TRANSCEIVER ENABLE
  dxl.begin(1000000); // BEGIN DYNAMIXEL AT BAUD RATE
  dxl.setPortProtocolVersion(DXL_PROTOCOL_VERSION);
  dxl.ping(DXL_ID);
  dxl.torqueOff(DXL_ID);
  dxl.setOperatingMode(DXL_ID,OP_POSITION);
  dxl.writeControlTableItem(CW_COMPLIANCE_MARGIN, DXL_ID, 1);
  dxl.writeControlTableItem(CCW_COMPLIANCE_MARGIN, DXL_ID, 1);
  dxl.writeControlTableItem(RETURN_DELAY_TIME, DXL_ID, 0);
  dxl.torqueOn(DXL_ID);
  Can0.begin(); // BEGIN CAN0
  Can0.setBaudRate(1000000); // SET BAUDRATE
  Can0.setMaxMB(16); // SET MAX MAILBOX SIZE... COULD BE USEFUL TO PLAY WITH THIS?
  Can0.setMBFilter(MB0, LINKID);
  Can0.enhanceFilter(MB0);
  Can0.enableMBInterrupts(); // ENABLE CAN INTERRUPT ON
  Can0.onReceive(MB0, rxAngle); // LINK CAN INTERRUPT TO FUNCTION
  updateangle.begin(setAngle,PIDPERIOD_US);
  //FeedbackTimer.begin(sendLog, FB_PERIOD_US);
  
}

void rxAngle(const CAN_message_t &cmd){
  dxlangle = cmd.buf[1];
  updated = true;
  sendLog();
}

void sendLog(){
  volatile int dxl_angle_read = trunc(dxl.getPresentPosition(DXL_ID,UNIT_DEGREE))-150; //PRESENT POSITION OF DXL
  volatile int enc_angle = trunc((90*analogRead(Encoder_pin)/1024)-45)*-1;
  
  fb_msg.id = 0;
  fb_msg.buf[0] = LINKID;
  fb_msg.buf[5] = 0;
  fb_msg.buf[6] = 0;

  if(enc_angle < 0) fb_msg.buf[5] = 1;
  if(dxl_angle_read < 0) fb_msg.buf[6] = 1;

  fb_msg.buf[1] = enc_angle/100;
  fb_msg.buf[2] = enc_angle%100;
  fb_msg.buf[3] = dxl_angle_read/100;
  fb_msg.buf[4] = dxl_angle_read%100;
  

  Can0.write(fb_msg);
  
}

void setAngle(){
  if(updated){
    dxl.setGoalPosition(DXL_ID, dxlangle,UNIT_DEGREE);
    updated = false;
  }
}


void loop() {

}
