/*******************************************************************************
* Copyright 2016 ROBOTIS CO., LTD.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*******************************************************************************/

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
  

}

void loop() {

  // set goal posttion
  angle = 10;
  // Set Goal Position in degree value
  dxl.setGoalPosition(DXL_ID, default_ang + angle, UNIT_DEGREE);
  // Print present position in raw value
  DEBUG_SERIAL.print("Present Position(raw) : ");
  DEBUG_SERIAL.println(dxl.getPresentPosition(DXL_ID, UNIT_DEGREE) - default_ang);
  DEBUG_SERIAL.println("Compliance_slope is :");
  DEBUG_SERIAL.println(dxl.readControlTableItem(CW_COMPLIANCE_SLOPE, DXL_ID));
//  DEBUG_SERIAL.println(dxl.readControlTableItem(CCW_COMPLIANCE_SLOPE, DXL_ID));
  DEBUG_SERIAL.println("Compliance_margin is :");
  DEBUG_SERIAL.println(dxl.readControlTableItem(CW_COMPLIANCE_MARGIN, DXL_ID));
//  DEBUG_SERIAL.println(dxl.readControlTableItem(CCW_COMPLIANCE_MARGIN, DXL_ID));


  delay(10);

}
