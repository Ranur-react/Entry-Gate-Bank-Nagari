// SETUP *************************************************************************
int data=0;
void setup(){

  Serial.begin(9600);       //Start serial communication at 9600bps
} //End Setup

// LOOP *************************************************************************
void loop()
{
  if(data==0){
    data=022;
    }else{
      data=0;
      }
Serial.write(data);
delay(1000);
} //End Loop
