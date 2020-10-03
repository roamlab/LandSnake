#include <PID_v1.h>
#include <Dynamixel2Arduino.h>


#define DXL_SERIAL   Serial1
#define DEBUG_SERIAL Serial
const uint8_t DXL_DIR_PIN = 2; // DYNAMIXEL Shield DIR PIN

const uint8_t DXL_ID = 1;
const float DXL_PROTOCOL_VERSION = 1.0;

float time1, t;
float angle;
int flag ;

Dynamixel2Arduino dxl(DXL_SERIAL, DXL_DIR_PIN);

const uint8_t Encoder_pin = 19;//define encoder pin

//define PID paras
double Setpoint, Input, Output;
double command_angle;
double test;
double default_ang;

double Min = -40;
double Max = 40;
int NewSampleTime = 1000;
double Kp = 1.4, Ki = 6 , Kd = 0.001  ;
PID myPID(&Input, &Output, &Setpoint, Kp, Ki, Kd, DIRECT);

///define original angle
double ori_ang;

void setup() {
  // put your setup code here, to run once:
  
  // Use UART port of DYNAMIXEL Shield to debug.
  DEBUG_SERIAL.begin(115200);

  // Set Port baudrate to 57600bps. This has to match with DYNAMIXEL baudrate.
  dxl.begin(1000000);
  // Set Port Protocol Version. This has to match with DYNAMIXEL protocol version.
  dxl.setPortProtocolVersion(DXL_PROTOCOL_VERSION);
  // Get DYNAMIXEL information
  dxl.ping(DXL_ID);

  // Turn off torque when configuring items in EEPROM area
  dxl.torqueOff(DXL_ID);
  dxl.setOperatingMode(DXL_ID, OP_POSITION);
  dxl.torqueOn(DXL_ID);

  myPID.SetMode(AUTOMATIC);

  ori_ang = analogRead(Encoder_pin);
  default_ang = dxl.getPresentPosition(DXL_ID, UNIT_DEGREE);
  flag=0;
}

void loop() {
  time1 = millis();
  t = time1/1000;
  angle = 30*sin(0.1 *t);
//  angle = 30;
//  if(flag%2 == 0)
//  {
//    angle = 30;
//  }
//  else
//  {
//    angle = -30;  
//  }
//  flag++;
  test = 360*(analogRead(Encoder_pin)-ori_ang)/1024;//transfer to degree

  Setpoint = angle;
  Input = -test;
  myPID.Compute();
  command_angle = Output+Input;
 
  dxl.setGoalPosition(DXL_ID, default_ang + command_angle , UNIT_DEGREE);

//  DEBUG_SERIAL.print("desired angle:");
  DEBUG_SERIAL.println(Setpoint);
//  DEBUG_SERIAL.print("current angle:");
  DEBUG_SERIAL.println(Input);
//  DEBUG_SERIAL.print("Command angle:");
//  DEBUG_SERIAL.println(command_angle);
  
  delay(100);
}
