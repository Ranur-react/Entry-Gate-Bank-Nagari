// SETUP *************************************************************************
int ledPin=8;
int rec;
void setup(){

  Serial.begin(9600);       //Start serial communication at 9600bps
  pinMode(ledPin, OUTPUT);

} //End Setup

// LOOP *************************************************************************
void loop()
{

  while(Serial.available()<2) //Wait for 2 bytes to arrive
  {
    //do nothing
  } //End While


  byte b1=Serial.read();  //Read Upper byte
  byte b2=Serial.read();  //Read Lower byte
  rec=(b1*256)+b2;          //Combine Upper & Lower bytes
  //Serial.println(b1, DEC);
  //Serial.println(b2, DEC);
  //Serial.println(rec, DEC);  //Print received data from Uno


  if (rec == 1) digitalWrite(ledPin, HIGH);    //Select Uno LED On
  else digitalWrite(ledPin, LOW);              //Select Uno LED Off


} //End Loop
