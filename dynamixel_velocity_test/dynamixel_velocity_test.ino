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

//This namespace is required to use Control table item names
using namespace ControlTableItem;

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
  
  dxl.writeControlTableItem(CW_COMPLIANCE_MARGIN, DXL_ID, 2);
  dxl.writeControlTableItem(CCW_COMPLIANCE_MARGIN, DXL_ID, 2);
  dxl.torqueOn(DXL_ID);

  // Limit the maximum velocity in Position Control Mode. Use 0 for Max speed
  //dxl.writeControlTableItem(PROFILE_VELOCITY, DXL_ID, 0);
  dxl.writeControlTableItem(PROFILE_VELOCITY, DXL_ID, 20);
  dxl.writeControlTableItem(PROFILE_ACCELERATION, DXL_ID, 20);
}

void loop() {
  // put your main code here, to run repeatedly:
  
  // Please refer to e-Manual(http://emanual.robotis.com/docs/en/parts/interface/dynamixel_shield/) for available range of value. 
  // Set Goal Position in RAW value
  //dxl.setGoalPosition(DXL_ID, 512);
  //DEBUG_SERIAL.println(dxl.getPresentPosition(DXL_ID, UNIT_DEGREE));
  //dxl.setGoalPosition(DXL_ID, 150, UNIT_DEGREE);
  /*float time1 = micros();
  float t1 = time1/1000000;
  float x = abs(100*sin(0.1*t1))+100;
  Serial.println(x);
  delay(10);*/
  Serial.println(dxl.readControlTableItem(PROFILE_VELOCITY, DXL_ID));
}
