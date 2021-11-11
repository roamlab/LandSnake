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



#define DEBUG_SERIAL Serial
int Encoder_pin=19;
const int numReadings = 10;

  
  float valueFilt = 90*analogRead(Encoder_pin)/1024.0;
float readings[numReadings];      // the readings from the analog input
int readIndex = 0;              // the index of the current reading
float total = 0;                  // the running total
float average = 0;                // the average


float ori_ang;

void setup() {
  digitalWrite(13, HIGH);
  Serial.begin(9600);
  ori_ang = analogRead(Encoder_pin);
  for (int thisReading = 0; thisReading < numReadings; thisReading++) {
    readings[thisReading] = 0;}

}

void loop() {
  //Serial.println("This is analog read: ");
  //Serial.println(analogRead(Encoder_pin));
  float encoderAngle = (90*analogRead(Encoder_pin)/1024.0)-45.0;
  valueFilt = (1-0.999)*encoderAngle + 0.999*valueFilt;
  total = total - readings[readIndex];
  // read from the sensor:
  readings[readIndex] = valueFilt;
  // add the reading to the total:
  total = total + readings[readIndex];
  // advance to the next position in the array:
  readIndex = readIndex + 1;

  // if we're at the end of the array...
  if (readIndex >= numReadings) {
    // ...wrap around to the beginning:
    readIndex = 0;
  }

  // calculate the average:
  average = total / numReadings;

  
  
  //Serial.println("Encoder angle is :");
  Serial.print(encoderAngle);
  Serial.print(" ");
  Serial.println(valueFilt);
  
  //delay(10);
}
