    #include <FlexCAN_T4.h>
#include <Dynamixel2Arduino.h>

FlexCAN_T4<CAN1, RX_SIZE_256, TX_SIZE_16> Can1; //Notice this is CAN1, need to use pins 22,23 on Teensy


CAN_message_t msg;
CAN_message_t inMsg;
/**
We use the following convention for storing data in the can message buff:
-msg.id corresponds to the link number where the message is sent to (master is 0)
-buf[0] corresponds to the link number where the message is sent from (master is 0)
-buf[1] corresponds to a key indicating the type of message where 1 = encoder, 2 = dynamixel encoder and 3 = dynamixel
-buf[2] corresponds to data being sent 
**/
int LINK = 1; //needs to updated for each link

//For Dynamixel
const uint8_t DXL_DIR_PIN = 2; // DYNAMIXEL Shield DIR PIN

const uint8_t DXL_ID = 1;
const float DXL_PROTOCOL_VERSION = 1.0;
#define DXL_SERIAL   Serial1
#define DEBUG_SERIAL Serial


Dynamixel2Arduino dxl(DXL_SERIAL, DXL_DIR_PIN);

int default_encoder_angle;
int default_dynamixel_angle;

const uint8_t Encoder_pin = 19;

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
  // Set Port Protocol Version. This has to match with DYNAMIXEL protocol version.
  dxl.setPortProtocolVersion(DXL_PROTOCOL_VERSION);
  // Get DYNAMIXEL information
  dxl.ping(DXL_ID);

  // Turn off torque when configuring items in EEPROM area
  dxl.torqueOff(DXL_ID);
  dxl.setOperatingMode(DXL_ID, OP_POSITION);
  dxl.torqueOn(DXL_ID);

  default_encoder_angle = analogRead(Encoder_pin);
}


void blink_led(){
  pinMode(13, LOW);
  delay(500);
  pinMode(13, HIGH);
  delay(500); 
}

// -------------------------------------------------------------
void loop(void)
{
  

  //FOR RECEIVING MESSAGES
  while(Can1.read(inMsg) && (inMsg.id == LINK)) {
    //blink_led();

    if(inMsg.buf[1] == 1){
      Serial.print("Encoder Request Received\n");
      int angle = (analogRead(Encoder_pin)-default_encoder_angle)*360/1024;
      msg.id = 0; //want to send to master
      msg.buf[0] = LINK;
      msg.buf[1] = 1;
      msg.buf[2] = angle;
      Can1.write(msg);
    }
    else if(inMsg.buf[1] == 2){
      Serial.print("Dynamixel Encoder Request Received\n");
      int angle = dxl.getPresentPosition(DXL_ID, UNIT_DEGREE);
      msg.id = 0; //want to send to master
      msg.buf[0] = LINK;
      msg.buf[1] = 2;
      msg.buf[2] = angle;
      Can1.write(msg);
    }
    else if(inMsg.buf[1] == 3){
      Serial.print("Dynamixel Set Poistion Request Received\n");
      int pos = inMsg.buf[2];
      dxl.setGoalPosition(DXL_ID, pos);
    } 
  }
  delay(100);
}
