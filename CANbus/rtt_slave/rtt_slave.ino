#include <FlexCAN.h>
#include <Time.h>
#include <TimeLib.h>
/* Setup callback for RoundTripTest */ 
class RoundTripTest : public CANListener 
{
public:
  void reply(CAN_message_t &frame, int mailbox);
  bool frameHandler(CAN_message_t &frame, int mailbox, uint8_t controller); //overrides the parent version so we can actually do something
};

void RoundTripTest::reply(CAN_message_t &frame, int mailbox)
{
  Can0.write(frame);
}

bool RoundTripTest::frameHandler(CAN_message_t &frame, int mailbox, uint8_t controller)
{
  reply(frame, mailbox);
  return true;
}

// Initialize object
RoundTripTest round_trip_test;

// Declare message
static CAN_message_t msg;

void setup() {
  delay(500);
  Serial.println(F("Running Round Trip Time performance test"));
  Can0.begin(50000);

  Can0.attachObj(&round_trip_test);
  round_trip_test.attachGeneralHandler();
}

void loop() {
  
}
