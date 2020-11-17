#include <iostream>
#include "Transfer.h"
using namespace std;

int main()
{
	int b1, b2;
	Dec2Bin dec2Bin(456);
	dec2Bin.transfer();
	b1 = dec2Bin.buf1;
	b2 = dec2Bin.buf2;
	cout << dec2Bin.buf1 << '\t' <<  dec2Bin.buf2 << endl;

	Bin2Dec bin2Dec(b1, b2);
	bin2Dec.transfer();
	cout << bin2Dec.msgAngle << endl;
	return 0;
}