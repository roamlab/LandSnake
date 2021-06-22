// Master of the CAN: writes in loop and 

#include <FlexCAN_T4.h>
FlexCAN_T4<CAN1, RX_SIZE_256, TX_SIZE_16> Can0;

void setup(void) {
  Serial.begin(115200); delay(400);
  pinMode(6, OUTPUT); digitalWrite(6, LOW); /* optional tranceiver enable pin */

  Can0.begin();
  Can0.setBaudRate(125000);
  Can0.setMaxMB(16);
  Can0.enableMBInterrupts();
  Can0.onReceive(canSniff);
  Can0.mailboxStatus();
}

void canSniff(const CAN_message_t &msg) {
  Serial.print("-----------------------------------------------------");
  Serial.println();
  
  Serial.print("MB "); Serial.print(msg.mb);
  Serial.print("  OVERRUN: "); Serial.print(msg.flags.overrun);
  Serial.print("  LEN: "); Serial.print(msg.len);
  Serial.print(" EXT: "); Serial.print(msg.flags.extended);
  Serial.print(" TS: "); Serial.print(msg.timestamp);
  Serial.print(" ID: "); Serial.print(msg.id, HEX);
  Serial.print(" Buffer: ");
  Serial.println();

  for ( uint8_t i = 0; i < msg.len; i++ ) {
    Serial.print(msg.buf[i], HEX); Serial.print(" ");
  } 
  Serial.println();
  if(msg.id == 0){
    Serial.print("Addressed to main.");
    Serial.println();
  }
  Serial.print("-----------------------------------------------------");
  Serial.println();
}





void loop() {
  Can0.events();

  static uint32_t timeout = millis();
  if ( millis() - timeout > 1) {
    
    CAN_message_t msg1;
    msg1.id = 2;
    for ( uint8_t i = 0; i < 8; i++ ) msg1.buf[i] = 2;
    Can0.write(msg1);
    
    CAN_message_t msg2;
    msg2.id = 1;
    for ( uint8_t i = 0; i < 8; i++ ) msg2.buf[i] = 3;
    Can0.write(msg2);
    timeout = millis();
  }

}
