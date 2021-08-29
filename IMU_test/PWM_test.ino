#include <Wire.h>

#include "SparkFun_BNO080_Arduino_Library.h" // Click here to get the library: http://librarymanager/All#SparkFun_BNO080

BNO080 myIMU;

void setup()
{
  Serial.begin(115200);
  Serial.println();
  Serial.println("BNO080 Read Example");
  
  Wire1.begin();
  

  if (myIMU.begin() == false)
  {
    //Serial.println(Wire1.endTransmission());
    Serial.println("BNO080 not detected at default I2C address. Check your jumpers and the hookup guide. Freezing...");
    while (1);
  }

  Wire1.setClock(400000); 

  myIMU.enableGyroIntegratedRotationVector(50); 
  myIMU.enableLinearAccelerometer(50); //Send data update every 50ms

  Serial.println(F("Gyro integrated rotation vector enabled"));
  Serial.println(F("Output in form i, j, k, real, gyroX, gyroY, gyroZ"));
}

void loop()
{
  //Look for reports from the IMU
  if (myIMU.dataAvailable() == true)
  {/*
    float quatI = myIMU.getQuatI();
    float quatJ = myIMU.getQuatJ();
    float quatK = myIMU.getQuatK();
    float quatReal = myIMU.getQuatReal();
    float gyroX = myIMU.getFastGyroX();
    float gyroY = myIMU.getFastGyroY();
    float gyroZ = myIMU.getFastGyroZ();

    
    Serial.println();

    Serial.print("QuatI: ");
    Serial.println(quatI,2);
    Serial.print("QuatJ: ");
    Serial.println(quatJ, 2);
    Serial.print("QuatK: ");
    Serial.println(quatK, 2);
    Serial.print("QuatReal: ");
    Serial.println(quatReal, 2);
    Serial.print("Gyrox: ");
    Serial.println(gyroX, 2);
    Serial.print("GyroY: ");
    Serial.println(gyroY, 2);
    Serial.print("GyroZ: ");
    Serial.println(gyroZ, 2);

    Serial.println();
*/
    float x = myIMU.getLinAccelX();
    float y = myIMU.getLinAccelY();
    float z = myIMU.getLinAccelZ();
    

    Serial.print("Acceleration along x axis:");
    Serial.println(x,2);
    Serial.print("Acceleration along y axis:");
    Serial.println(y, 2);
    Serial.print("Acceleration along z axis:");
    Serial.println(z, 2);

    Serial.println();

  }
}
