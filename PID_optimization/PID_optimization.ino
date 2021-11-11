IntervalTimer PIDTimer;

unsigned int PIDT = 800000;
float Encoder_pin = 512;
float Dxl_val = 600;
float test; 

float goalpoint=10;
float default_ang;
float kp = 1, ki = 0.0001 , kd =0.0001; // GAINS 
float outmin, outmax;
float Input, Output; // PID I/O STUFF
float Iterm, lastInput, derror; // PID 
float command_angle; // PID OUTPUT SENT TO DXL
float error;
float lasterror;
unsigned long timenow;
unsigned long dt=0;
unsigned long lasttime=0;


void ExecuteCommand() {

   //Setpoint = goalpoint; 
  //Serial.print("This is Setpoint");
  //Serial.println(Setpoint);
  
  
  //if(Setpoint<0){Setpoint*=-1;}
  //Serial.println(Setpoint);

  timenow = micros();
  if(dt <= 0 || lasttime==0 ){dt = 1e-6; }
  else{dt = timenow-lasttime;}
  
  
  test = (90*Encoder_pin/1024.0)-45.0;
  test = (1-0.915)*((90*Encoder_pin)/1024.0-45.0) + 0.915*test; //transfer to degree
 
  //Setpoint = 44*sin(1.1*t1);
  Input = test;
  Serial.print("Input");
  Serial.print(Input);
  
  //double currpos = dxl.getPresentPosition(DXL_ID, UNIT_DEGREE);
  //myPID.Compute();
  //command_angle = Output;
  //noInterrupts();
  //__disable_irq();
  error = goalpoint - Input;
  Serial.print("error");
  Serial.println(error);
  if(abs(error)>0.4){
  
    Iterm+=ki*error*dt;
    derror = error-lasterror;

    Output = kp*error+Iterm+kd*derror/dt;
    if(Output>outmax){Output=outmax;}
    else if (Output<outmin){Output=outmin;}

    lastInput = Input;
    lasttime = timenow;
    lasterror = error;
    command_angle = Output;
    
    Serial.print("DXLOutPut");
    Serial.println(Output);

    Encoder_pin=1024.0*(((Output-0.915*Output)/(1-0.915))+45.0)/90.0;
    Serial.println("Encoder_Pin");
    Serial.println(Encoder_pin);
    //dxl.setGoalPosition(DXL_ID, currpos - command_angle , UNIT_DEGREE);
    
    
    
    
    }
    //Serial.println("Now");
    //Serial.println(Input);
}

void setup() {

PIDTimer.begin(ExecuteCommand, PIDT);
outmax = 90;
outmin = -90;

}

void loop(){
  }
