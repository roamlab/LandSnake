#include <iostream>

#ifndef Transfer
#define Transfer


class Dec2Bin
{
public:
	Dec2Bin(int encoder_angle);
	int encoderAngle;
	int hexMask;
	int buf1;
	int buf2;
	void transfer();

private:
};

class Bin2Dec
{
public:Bin2Dec(int buf1, int buf2);
	  int Buf1;
	  int Buf2;
	  int msgAngle;
	  void transfer();
private:
};


#endif

