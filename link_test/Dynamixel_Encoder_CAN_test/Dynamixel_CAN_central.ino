
#include <FlexCAN_T4.h>

#include <Dynamixel2Arduino.h>
 
FlexCAN_T4<CAN1, RX_SIZE_256, TX_SIZE_16> Can1; //Notice this is CAN1, need to use pins 22,23 on Teensy

//Plotter P;
CAN_message_t msg;
CAN_message_t msg2;
CAN_message_t msgin;
/**
We use the following convention for storing data in the can message buff:
-msg.id corresponds to the link number where the message is sent to (master is 0)
-buf[0] corresponds to the link number where the message is sent from (master is 0)
-buf[1] corresponds to a key indicating the type of message where 1 = encoder, 2 = dynamixel encoder and 3 = dynamixel
-buf[2] corresponds to data being sent 
**/
int LINK = 0;
const uint8_t DXL_DIR_PIN = 2; // DYNAMIXEL Shield DIR PIN

const uint8_t DXL_ID = 0;
const float DXL_PROTOCOL_VERSION = 1.0;
#define DXL_SERIAL   Serial1
#define DEBUG_SERIAL Serial
using namespace ControlTableItem ;

float time1, t;
double angle;
double default_ang;
double slaveangle2, slaveangle1;


Dynamixel2Arduino dxl(DXL_SERIAL, DXL_DIR_PIN);

int default_encoder_angle;//dec
int default_dynamixel_angle;//dec


void setup(void)
{
  //for LED onboard Teensy
  pinMode(13, OUTPUT); 
  digitalWrite(13, HIGH); 

  Serial.begin(115200); //for Serial monitor

  Can1.begin();  
  Can1.setBaudRate(1000000);  
  
  
  
  msg.len = 4;
  msg.buf[0] = 0x00;
  msg.buf[1] = 0x01;
  msg.buf[2] = 0x02;
  msg.buf[3] = 0x03;
  msg2.len = 4;
  msg2.buf[0] = 0x00;
  msg2.buf[1] = 0x01;
  msg2.buf[2] = 0x02;
  msg2.buf[3] = 0x03;
  
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

  default_ang = dxl.getPresentPosition(DXL_ID, UNIT_DEGREE);

}

void request_encoder(int link_num, CAN_message_t request){
  request.id = link_num;
  request.buf[0] = 0; 
  request.buf[1] = 3;
  Can1.write(request);
  delay(100);
}

void request_dynamixel_encoder(int link_num, CAN_message_t request){
  request.id = link_num;
  request.buf[0] = 1;
  request.buf[1] = 2;
  Can1.write(request);
  delay(100);
}

//position is between 0 and 1023
void move_link(int position, int link_num, CAN_message_t request){
  request.id = link_num;
  request.buf[0] = 0;
  request.buf[1] = 1;
  request.buf[2] = position; 
  //Serial.println(position);
  Can1.write(request);
  //delay(100);
}


// -------------------------------------------------------------
void loop(void)
{
  int a = 0,b = 0;
  double angle = 0;
  //REQUESTS TO SEND MESSAGES GO HERE
  //request_dynamixel_encoder(1, msg);
  time1 = millis();
  t = time1/1000;
  slaveangle2 = floor(abs(85*sin(0.1*t)));
  slaveangle1 = floor(abs(85*sin(0.1*t+3.14/12)));

  move_link(slaveangle1, 1, msg);

  move_link(slaveangle2, 2, msg2);

  //Serial.println("Command: ");
  //Serial.println(slaveangle1);
  //Serial.print(slaveangle2);
  
  
/*
      // Set Goal Position in degree value
  dxl.setGoalPosition(DXL_ID, default_ang + angle, UNIT_DEGREE);
  //request_dynamixel_encoder(0,msg);
  */

  //FOR RECEIVING MESSAGES
  while(Can1.read(msgin) && (msgin.id == LINK)) {
    
    if(msgin.buf[1] == 1)
    {
      
      //Serial.println("Encoder Poistion Received:  ");
      Serial.println(msgin.buf[2]);
      
//      Serial.print(a);
//      Serial.print('\n');
//      Serial.print(b);
//      Serial.print('\n');
     // Serial.print(test);
      //Serial.print('\n');
    }
    else if(msgin.buf[1] == 2){
      
      if(msgin.buf[3] == 9){ angle = -1*msgin.buf[2];}
      else {angle = msgin.buf[2];}
      Serial.print("Dynamixel Encoder Position Received:  ");
      Serial.print(angle);
      Serial.print("\n");
    } 
  }
  //delay(100);
  
  
}


  
