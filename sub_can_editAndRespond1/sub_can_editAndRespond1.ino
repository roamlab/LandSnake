#include <FlexCAN_T4.h>
FlexCAN_T4<CAN1, RX_SIZE_16, TX_SIZE_16> Can0;
const uint LEDPIN = 13;

void setup(void) {
  pinMode(6, OUTPUT); digitalWrite(6, LOW); /* optional tranceiver enable pin */
  pinMode(LEDPIN, OUTPUT); digitalWrite(LEDPIN, LOW); /* onboard indicating led */
  Can0.begin(); // begin CAN0
  Can0.setBaudRate(125000); // Set baudrate
  Can0.setMaxMB(16); // Set Max Mailbox Size
  Can0.enableMBInterrupts(); // Enable Interrupt
  Can0.onReceive(MB1,reply); // Declare Interrupt, minor change
  
}

/* 
 *  Callback Function for any CAN interrupt
 *  creates random message, sends it back onto the CAN
*/
void reply(const CAN_message_t &msg) {

    CAN_message_t rply; // creates message
    rply.id = 1; // random ID
    for ( uint8_t i = 0; i < 8; i++ ) rply.buf[i] = msg.buf[i] +1;
    Can0.write(MB0,rply); // writes message
}

void loop() {
  Can0.events(); //pushes interrupt frames
  
}
