#include <FlexCAN_T4.h>
//#include <Transfer.h>
#include <PID_v1.h>
#include <Dynamixel2Arduino.h>

FlexCAN_T4<CAN1, RX_SIZE_256, TX_SIZE_16> Can1; 


CAN_message_t msg;
CAN_message_t inMsg;
/**
We use the following convention for storing data in the can message buff:
-msg.id corresponds to the link number where the message is sent to (master is 0)
-buf[0] corresponds to the link number where the message is sent from (master is 0)
-buf[1] corresponds to a key indicating the type of message where 1 = encoder, 2 = dynamixel encoder and 3 = dynamixel
-buf[2] corresponds to data being sent 
**/
int LINK = 2; //needs to updated for each link

//For Dynamixel
const uint8_t DXL_DIR_PIN = 2; // DYNAMIXEL Shield DIR PIN

const uint8_t DXL_ID = 1;
const float DXL_PROTOCOL_VERSION = 1.0;
#define DXL_SERIAL   Serial1
#define DEBUG_SERIAL Serial
using namespace ControlTableItem ;

float time1, t;
double angle;
double default_ang;


Dynamixel2Arduino dxl(DXL_SERIAL, DXL_DIR_PIN);

int default_encoder_angle;//dec
int default_dynamixel_angle;//dec

const uint8_t Encoder_pin = 19;
double Setpoint, Input, Output;
double command_angle;
double test;
double maxKp = 0.15, maxKi = 0.15, maxKd = 0.015;
double Kp = 0.6, Ki = 0.2 , Kd = 0.0004;
PID myPID(&Input, &Output, &Setpoint, Kp, Ki, Kd, DIRECT);

///define original angle
double ori_ang;

void setup(void)
{
  //for LED onboard Teensy
  pinMode(13, OUTPUT); 
  digitalWrite(13, HIGH); 

  //for Serial monitor
  Serial.begin(115200); 

  Can1.begin();  
  Can1.setBaudRate(1000000);  

  msg.len = 8;
  msg.buf[0] = 0x00;
  msg.buf[1] = 0x01;
  msg.buf[2] = 0x02;
  msg.buf[3] = 0x03;
  msg.buf[4] = 0x04;
  msg.buf[5] = 0x05;
  msg.buf[6] = 0x06;
  msg.buf[7] = 0x07;

  //For Dynamixel Setup
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

  myPID.SetOutputLimits(-40, 40);
  myPID.SetMode(AUTOMATIC);

  ori_ang = 90*(analogRead(Encoder_pin))/1024;
  default_ang = dxl.getPresentPosition(DXL_ID, UNIT_DEGREE);//Set defaut angle to make the orginal position to be 0
}


void blink_led(){
  pinMode(13, LOW);
  delay(500);
  pinMode(13, HIGH);
  delay(500); 
}

void transfer(float angle)
{
    msg.buf[3] = angle/256;
    Serial.print("This is msg.buf[2]");
    Serial.print(msg.buf[2]);
    msg.buf[2] = angle-(msg.buf[2]*256);
    Serial.print("This is msg.buf[2]*256");
    Serial.print(msg.buf[2]*256);
}

// -------------------------------------------------------------
void loop(void)
{ 
  blink_led();
  /*
  time1 = millis();
  t = time1/1000;
  angle = 30*sin(0.4*t+LINK*3.14/8);

  // Set Goal Position in degree value
  dxl.setGoalPosition(DXL_ID, default_ang + angle, UNIT_DEGREE);
  */
  //FOR RECEIVING MESSAGES
  while(Can1.read(inMsg) && (inMsg.id == LINK)) {

    if(inMsg.buf[1] == 1){
      //Serial.print("Encoder Request Received\n");
      angle = inMsg.buf[2];
      test = 90 * (analogRead(Encoder_pin)) / 1024; //transfer to degree
      //Serial.println(test);
      Setpoint = angle;
      Input = test;
      myPID.Compute();
      command_angle = Output;
      dxl.setGoalPosition(DXL_ID, dxl.getPresentPosition(DXL_ID, UNIT_DEGREE) - command_angle , UNIT_DEGREE);

      //int angle = 562;
      msg.id = 0; //want to send to master
      msg.buf[0] = LINK;
      msg.buf[1] = 1;
      msg.buf[2] = 90 * (analogRead(Encoder_pin)) / 1024;
      //transfer(angle);
      Can1.write(msg);
      //Serial.print('\n');
      //Serial.print(msg.buf[3]);
      //Serial.print('\n');
      //Serial.print(msg.buf[2]);
      //Serial.print("\n");
    }
    else if(inMsg.buf[1] == 2){
      Serial.print("Dynamixel Encoder Request Received\n");
      
      // Print present position in raw value
      DEBUG_SERIAL.print("Present Position(raw) : ");
      int present = dxl.getPresentPosition(DXL_ID, UNIT_DEGREE) - default_ang;
      DEBUG_SERIAL.print(present);
      DEBUG_SERIAL.print('\n');
      //if(newangle < 0){newangle = -angle; msg.buf[3] = 9;}
      //else{msg.buf[3] = 10;}
      msg.id = 1; //want to send to master
      msg.buf[0] = 1;
      msg.buf[1] = 2;
      //DEBUG_SERIAL.print(present);
      msg.buf[2] = present;
      //eDEBUG_SERIAL.print(msg.buf[2]);
      Can1.write(msg);
    }
    else if(inMsg.buf[1] == 3){
      Serial.print("Dynamixel Set Poistion Request Received\n");
      int pos = inMsg.buf[2];
      dxl.setGoalPosition(DXL_ID, pos);
    } 
  }
  //delay(100);
}
