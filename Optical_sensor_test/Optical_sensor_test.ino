
#include"PMW.h"
PMW pmw;
int xycounts[2];
byte testctr=0;
unsigned long currTime;
unsigned long timer;
unsigned long pollTimer;
    
void setup() {
  Serial.begin(115200);
  SPI.begin();
  pmw.set_firmware(PMW3360_firmware_length, PMW3360_firmware_data);
  pmw.startup();
}

void loop() {
    pmw.read_motion(xycounts);
    xycounts[0] = convTwosComp(xycounts[0]);
    xycounts[1] = convTwosComp(xycounts[1]);
    Serial.print("This is dx: ");
    Serial.print(xycounts[0]);
    Serial.print(" | ");
    Serial.print("This is dy: ");
    Serial.println(xycounts[1]);
    delay(50);
}
