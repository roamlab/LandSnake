#include <FlexCAN_T4.h>
 
FlexCAN_T4<CAN1, RX_SIZE_256, TX_SIZE_16> Can1; //Notice this is CAN1, need to use pins 22,23 on Teensy

CAN_message_t msg;
CAN_message_t inMsg;

// -------------------------------------------------------------
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

void print_msg(CAN_message_t toto) {
  Serial.print("Message id ");
  Serial.println(toto.id);
  for(uint8_t i = 0 ; i< toto.len;i++) {
      Serial.print(toto.buf[i]);
      Serial.print("\t");
    }
    Serial.println();
}


// -------------------------------------------------------------
void loop(void)
{
  
  //RECEIVE MESSAGE
  while(Can1.read(inMsg)) {
    //blink LED so we can see message is received
    pinMode(13, LOW);
    delay(500);
    pinMode(13, HIGH);
    delay(500);
    Serial.println("CANtest - Read bus1");
    print_msg(inMsg);
    break;
  }
  Can1.write(msg);
  msg.id++; 
  msg.buf[0]++;
  delay(1000);
}
