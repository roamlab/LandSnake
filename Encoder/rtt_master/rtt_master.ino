
#include <FlexCAN.h>
#include <Time.h>
#include <TimeLib.h>

/* Setup callback for RoundTripTest */ 
class RoundTripTest : public CANListener 
{
public:
  bool frameHandler(CAN_message_t &frame, int mailbox, uint8_t controller); //overrides the parent version so we can actually do something
  long int time_sent;
  long int time_elapsed;
};

bool RoundTripTest::frameHandler(CAN_message_t &frame, int mailbox, uint8_t controller)
{
    time_elapsed = millis() - time_sent;
//    Serial.println(frame.buf[1]);
    return true;
}

// Initialize object
RoundTripTest round_trip_test;

// Declare message
static CAN_message_t msg;

void setup() {
  delay(1000);
  Serial.println(F("Running Round Trip Time performance test"));
  Can0.begin(50000);

  Can0.attachObj(&round_trip_test);
  round_trip_test.attachGeneralHandler();
  
  msg.ext = 0;
  msg.id = 0x100;
  msg.len = 8;
  for(int i = 0; i < 8; i++){
    msg.buf[i] = i*10;
  }
}

void loop() {
  round_trip_test.time_sent = millis();
  Can0.write(msg);
  delay(10); // Note: This does not stop interrupts.
  Serial.println(round_trip_test.time_elapsed);  
}
