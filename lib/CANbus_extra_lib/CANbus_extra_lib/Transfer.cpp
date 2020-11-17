#include "Transfer.h"
#include <iostream>

Dec2Bin::Dec2Bin(int encoder_angle)
{
	encoderAngle = encoder_angle;
	hexMask = 0XFF;
	buf1 = 0;
	buf2 = 0;
}

void Dec2Bin::transfer()
{
	buf1 = encoderAngle & hexMask;
	buf2 = (encoderAngle >> 8) & hexMask;
}

Bin2Dec::Bin2Dec(int buf1, int buf2)
{
	Buf1 = buf1;
	Buf2 = buf2;
	msgAngle = 0;
}

void Bin2Dec::transfer()
{
	msgAngle = (Buf2 <<8 )+Buf1;
}