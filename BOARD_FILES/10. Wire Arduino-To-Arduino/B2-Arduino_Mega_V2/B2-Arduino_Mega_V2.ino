

// SETUP *************************************************************************
void setup()
{
  Serial.begin(9600);      // start serial communication at 9600bps
  Serial1.begin(9600);     // start serial1 communication at 9600bps
  Serial.flush();
  Serial1.flush();
  
} // End Setup


// LOOP *************************************************************************

void loop()
{


  
int dataFromB2=0;
Serial.println("Waiting data . . .");
  while(Serial1.available()>0) //Wait for 2 bytes to arrive
  {
    Serial.println("Serial Nyambung");
        dataFromB2=Serial1.read();
      Serial.println("Data di dapatkan: ");
      Serial.println(dataFromB2);
      delay(1000);
  } //End While
    delay(1000);
}  // End Loop.
