#include <Dynamixel2Arduino.h>

#define DXL_SERIAL   Serial1
#define DEBUG_SERIAL Serial
const uint8_t DXL_DIR_PIN = 2; // DYNAMIXEL Shield DIR PIN
const uint8_t DXL_ID = 1;
const float DXL_PROTOCOL_VERSION = 1.0;

Dynamixel2Arduino dxl(DXL_SERIAL, DXL_DIR_PIN);

using namespace ControlTableItem ;

double default_ang;
double angle;
float time1, t;
int link = 0;
int f = 0.1;

void setup() {
  // put your setup code here, to run once:
  
  // Use UART port of DYNAMIXEL Shield to debug.
  DEBUG_SERIAL.begin(115200);

  // Set Port baudrate to 57600bps. This has to match with DYNAMIXEL baudrate.
  dxl.begin(1000000);
  dxl.scan();
  // Set Port Protocol Version. This has to match with DYNAMIXEL protocol version.
  dxl.setPortProtocolVersion(DXL_PROTOCOL_VERSION);
  // Get DYNAMIXEL information
  dxl.ping(DXL_ID);

  // Turn off torque when configuring items in EEPROM area
  dxl.torqueOff(DXL_ID);
  dxl.setOperatingMode(DXL_ID, OP_POSITION);
//  dxl.writeControlTableItem(CW_COMPLIANCE_SLOPE, DXL_ID, 8);
//  dxl.writeControlTableItem(CCW_COMPLIANCE_SLOPE, DXL_ID, 8);
  dxl.writeControlTableItem(CW_COMPLIANCE_MARGIN, DXL_ID, 2);
  dxl.writeControlTableItem(CCW_COMPLIANCE_MARGIN, DXL_ID, 2);
  dxl.torqueOn(DXL_ID);

  default_ang = dxl.getPresentPosition(DXL_ID, UNIT_DEGREE);//Set defaut angle to make the orginal position to be 0
  //ori_ang = analogRead(Encoder_pin);

}

void loop() {
  // set goal posttion
  
  DEBUG_SERIAL.print("Present Position(raw) : ");
  DEBUG_SERIAL.print(dxl.getPresentPosition(DXL_ID, UNIT_DEGREE));
  DEBUG_SERIAL.print('\n');
  
  DEBUG_SERIAL.print('\n');
  
  delay(10);
}
