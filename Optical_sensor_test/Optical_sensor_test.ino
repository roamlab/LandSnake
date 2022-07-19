#include<Dynamixel2Arduino.h> // DXL COMMS HEADER FILE
const uint8_t DXL_ID = 1, DXL_DIR_PIN = 2; // DXL MOTOR ID AND DIRECTION
const float DXL_PROTOCOL_VERSION = 1.0; // DXL COMM PROTOCOL
using namespace ControlTableItem; // DXL CONTROL TABLE
#define DXL_SERIAL Serial1 // SERIAL COMMSf

Dynamixel2Arduino dxl(DXL_SERIAL, DXL_DIR_PIN); // DXL MOTOR OBJECT

IntervalTimer WriteAngle;
IntervalTimer ReadEnc;
unsigned int WRITE_DXL = 1400; 
unsigned int READ_ENC = 1400;
int starttime;
int angle = 150;
int increment = 1;


#include"PMW.h"
PMW pmw;
signed int xycounts[2];
byte testctr=0;
unsigned long currTime;
unsigned long timer;
unsigned long pollTimer;
    
void setup() {
  Serial.begin(115200);
  SPI.begin();
  pmw.set_firmware(PMW3360_firmware_length, PMW3360_firmware_data);
  pmw.startup();
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
  WriteAngle.begin(write_DXL, WRITE_DXL);
  ReadEnc.begin(read_enc, READ_ENC);
  starttime = micros();

}


void write_DXL(){
  /*
  if(angle >= 190 || angle <= 110){
    increment = increment*-1;
  }
  angle = angle + increment;
  dxl.setGoalPosition(DXL_ID,angle,UNIT_DEGREE);
  */

  angle = 150 + 40*cos(micros()*120*3.14/(1000000*180));
  dxl.setGoalPosition(DXL_ID,angle,UNIT_DEGREE);
  
}


void read_enc() {
    
    pmw.read_motion(xycounts);
    xycounts[0] = convTwosComp(xycounts[0]);
    xycounts[1] = convTwosComp(xycounts[1]);
    Serial.print("This is dx: ");
    Serial.print(xycounts[0]);
    Serial.print(" | ");
    Serial.print("This is dy: ");
    Serial.println(xycounts[1]);
}

void loop(){
  
}
