
#include <FlexCAN_T4.h>
 
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
int LINK = 0;

void setup(void)
{
  //for LED onboard Teensy
  pinMode(13, OUTPUT); 
  digitalWrite(13, HIGH); 

  Serial.begin(115200); //for Serial monitor

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

}

void request_encoder(int link_num, CAN_message_t request){
  request.id = link_num;
  request.buf[0] = 0; 
  request.buf[1] = 1;
  Can1.write(request);
  delay(100);
}

void request_dynamixel_encoder(int link_num, CAN_message_t request){
  request.id = link_num;
  request.buf[0] = 0;
  request.buf[1] = 2;
  Can1.write(request);
  delay(100);
}

//position is between 0 and 1023
void set_dynamixel(int position, int link_num, CAN_message_t request){
  request.id = link_num;
  request.buf[0] = 0;
  request.buf[1] = 3;
  request.buf[2] = position; 
  Can1.write(request);
  delay(100);
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
  int a = 0,b = 0;
  int test = 0;
  //REQUESTS TO SEND MESSAGES GO HERE
  //request_dynamixel_encoder(1, msg);
  request_encoder(1,msg);

  //FOR RECEIVING MESSAGES
  while(Can1.read(inMsg) && (inMsg.id == LINK)) {
    
    if(inMsg.buf[1] == 1)
    {
      blink_led();
      test = 256*inMsg.buf[3] + inMsg.buf[2];
      a = inMsg.buf[3];
      b = inMsg.buf[2];
      Serial.print("Encoder Poistion Received:  ");
//      Serial.print(a);
//      Serial.print('\n');
//      Serial.print(b);
//      Serial.print('\n');
      Serial.print(test);
      Serial.print('\n');
    }
    else if(inMsg.buf[1] == 2){
      Serial.print("Dynamixel Encoder Position Received:  "+ inMsg.buf[2]);
    } 
  }
  //delay(100);
  //blink_led();
  
  
}


  
