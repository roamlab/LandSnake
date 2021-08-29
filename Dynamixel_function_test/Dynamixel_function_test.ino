
#include <Dynamixel2Arduino.h>

const uint8_t DXL_DIR_PIN = 2; // DYNAMIXEL Shield DIR PIN

const uint8_t DXL_ID = 1;
const float DXL_PROTOCOL_VERSION = 1.0;
#define DXL_SERIAL   Serial1
#define DEBUG_SERIAL Serial
using namespace ControlTableItem ;


Dynamixel2Arduino dxl(DXL_SERIAL, DXL_DIR_PIN);



void setup(void)
{
  //for LED onboard Teensy
  pinMode(13, OUTPUT); 
  digitalWrite(13, HIGH); 

  Serial.begin(2000000); //for Serial monitor

  //For Dynamixel Setup
    // Use UART port of DYNAMIXEL Shield to debug.
  //DEBUG_SERIAL.begin(115200);
 
  dxl.begin(1000000);
  dxl.scan();
  // Set Port Protocol Version. This has to match with DYNAMIXEL protocol version.
  dxl.setPortProtocolVersion(DXL_PROTOCOL_VERSION);
  // Get DYNAMIXEL information
  dxl.ping(DXL_ID);

  // Turn off torque when configuring items in EEPROM area
  dxl.torqueOff(DXL_ID);
  dxl.setOperatingMode(DXL_ID, OP_POSITION);
  dxl.writeControlTableItem(CW_COMPLIANCE_MARGIN, DXL_ID, 2);
  dxl.writeControlTableItem(CCW_COMPLIANCE_MARGIN, DXL_ID, 2);
  dxl.torqueOn(DXL_ID);
  dxl.writeControlTableItem(RETURN_DELAY_TIME, DXL_ID, 0);
  //default_ang = dxl.getPresentPosition(DXL_ID, UNIT_DEGREE);
  
  //DEBUG_SERIAL.println(dxl.readControlTableItem(RETURN_DELAY_TIME, DXL_ID));

}




// -------------------------------------------------------------
void loop(void)
{
  //long starttime = micros();
  Serial.println(dxl.getPresentPosition(DXL_ID, UNIT_DEGREE));
  //long endtime = micros();
  //Serial.println(-starttime+endtime);
  //dxl.getPresentPosition(DXL_ID, UNIT_DEGREE);
  //dxl.getPresentPosition(DXL_ID, UNIT_DEGREE);
  delay(0.5);
  
  
  
  
}


  
