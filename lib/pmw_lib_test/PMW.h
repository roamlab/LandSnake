
// -----------------------------------------------------------
// Teensy Library for PMW3360 Optical Sensor


#ifndef __PMW_H__
#define __PMW_H__

#include<Arduino.h>
#include<SPI.h>
#include"PMW3360DM.h"

class PMW
{
  private:
    int SPI_clock;
    int SPI_mode;
    int SPI_bitorder;
    unsigned short firmware_length;
    const unsigned char* firmware_data;
    bool initialized;
     
  public:
    PMW();
    int SS_pin;
    void SPI_set_clock(int freq){SPI_clock = freq;} // freq in Hz
    void SPI_set_SS(int pin){SS_pin = pin;}
    void SPI_begin();
	  void SPI_end();
    byte read_reg(byte reg_addr);
    void write_reg(byte reg_addr, byte data);
    void set_firmware(const unsigned short firmware_length, const unsigned char* firmware_data);
    void upload_firmware();
    void startup();
    void disp_startup_info();
    void read_motion(int* xymotion);
};

int convTwosComp(int b);

#endif

