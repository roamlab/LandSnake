#include<SPI.h>
#include"PMW.h"

PMW::PMW(){
    SPI_clock = 4000000;
    SPI_mode = SPI_MODE3;
    SPI_bitorder = MSBFIRST;
    SS_pin = 10;
    initialized = false;
}

void PMW::SPI_begin(){
  SPI.beginTransaction(SPISettings(SPI_clock, SPI_bitorder, SPI_mode));
  digitalWrite(SS_pin, LOW);
  } //correct

void PMW::SPI_end(){
  digitalWrite(SS_pin, HIGH);
  SPI.endTransaction();
  } //correct

byte PMW::read_reg(byte reg_addr){
  SPI_begin();
  
  // send adress of the register, with MSBit = 0 to indicate it's a read
  SPI.transfer(reg_addr & 0x7f ); // 0x7f = 0b0111 1111
  delayMicroseconds(100); // tSRAD
  
  // read data
  byte data = SPI.transfer(0);
  delayMicroseconds(1); // tSCLK-NCS for read operation is 120ns
  
  SPI_end();
  delayMicroseconds(19); //  tSRW/tSRR (=20us) minus tSCLK-NCS

  return data;
  }

void PMW::write_reg(byte reg_addr, byte data){
  SPI_begin();
  
  //send adress of the register, with MSBit = 1 to indicate it's a write
  SPI.transfer(reg_addr | 0x80 );
  
  //send data
  SPI.transfer(data);
  
  delayMicroseconds(20); // tSCLK-NCS for write operation
  SPI_end();
  delayMicroseconds(100); // tSWW/tSWR (=120us) minus tSCLK-NCS. Could be shortened, but is looks like a safe lower bound
  }

void PMW::set_firmware(unsigned short len, const unsigned char* data){
  firmware_length = len;
  firmware_data = data;
}

void PMW::upload_firmware(){
  // send the firmware to the chip, cf p.18 of the datasheet
  Serial.println("Uploading firmware...");

  //Write 0 to Rest_En bit of Config2 register to disable Rest mode.
  write_reg(Config2, 0x20);
  
  // write 0x1d in SROM_enable reg for initializing
  write_reg(SROM_Enable, 0x1d);
  
  // wait for more than one frame period
  delay(10); // assume that the frame rate is as low as 100fps... even if it should never be that low
  
  // write 0x18 to SROM_enable to start SROM download
  write_reg(SROM_Enable, 0x18); 
  
  // write the SROM file (=firmware data) 
  SPI_begin();
  SPI.transfer(SROM_Load_Burst | 0x80); // write burst destination adress
  delayMicroseconds(15);
  
  // send all bytes of the firmware
  unsigned char c;
  for(int i = 0; i < firmware_length; i++){ 
    c = (unsigned char)pgm_read_byte(firmware_data + i);
    SPI.transfer(c);
    delayMicroseconds(15);
  }

  //Read the SROM_ID register to verify the ID before any other register reads or writes.
  read_reg(SROM_ID);

  //Write 0x00 to Config2 register for wired mouse or 0x20 for wireless mouse design.
  write_reg(Config2, 0x00);

  // set initial CPI resolution
  write_reg(Config1, 0x31); // initially it was 0x15
  
  SPI_end();
  }

void PMW::disp_startup_info(void){
  int oreg[7] = {0x00,0x3F,0x2A,0x02};
  char* oregname[] = {"Product_ID","Inverse_Product_ID","SROM_Version","Motion"};
  byte regres;

  digitalWrite(SS_pin,LOW);
  //SPI_begin();
  int rctr=0;
  for(rctr=0; rctr<4; rctr++){
    SPI.transfer(oreg[rctr]);
    delay(1);
    Serial.println("---");
    Serial.println(oregname[rctr]);
    Serial.println(oreg[rctr],HEX);
    regres = SPI.transfer(0);
    Serial.println(regres,BIN);  
    Serial.println(regres,HEX);  
    delay(1);
  }
  digitalWrite(SS_pin,HIGH);
  //SPI_end();
}

void PMW::startup(void){
  
  pinMode(SS_pin,OUTPUT);
  
  Serial.println("Performing Startup.....");
  SPI_end(); // ensure that the serial port is reset
  SPI_begin(); // ensure that the serial port is reset
  SPI_end(); // ensure that the serial port is reset
  write_reg(Power_Up_Reset, 0x5a); // force reset
  delay(50); // wait for it to reboot
  // read registers 0x02 to 0x06 (and discard the data)

  // TODO: Remove printing data after testing
  byte data;
  data = read_reg(Motion);
  Serial.println(data);
  data = read_reg(Delta_X_L);
  Serial.println(data);
  data = read_reg(Delta_X_H);
  Serial.println(data);
  data = read_reg(Delta_Y_L);
  Serial.println(data);
  data = read_reg(Delta_Y_H);
  Serial.println(data); 
  // upload the firmware
  upload_firmware();
  delay(10);
  Serial.println("Optical Chip Initialized");
  delay(5000);
  disp_startup_info();
  initialized = true;
  }

void PMW::read_motion(int* xymotion){
   if(initialized){
    //Serial.println("i");
    //write 0x01 to Motion register and read from it to freeze the motion values and make them available
    write_reg(Motion, 0x01);
    read_reg(Motion);
    
    xymotion[0] = (int)read_reg(Delta_X_L);
    xymotion[1] = (int)read_reg(Delta_Y_L);
    //Serial.println(xymotion[0]);
    //Serial.println(xymotion[1]);  
    }
}

int convTwosComp(int b){
  //Convert from 2's complement
  if(b & 0x80){
    b = -1 * ((b ^ 0xff) + 1);
    }
  return b;
  }

