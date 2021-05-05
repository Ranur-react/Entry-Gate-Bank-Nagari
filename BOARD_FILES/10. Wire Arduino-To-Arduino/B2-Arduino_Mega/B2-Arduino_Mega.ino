

// SETUP *************************************************************************
void setup()
{
  Serial.begin(9600);      // start serial communication at 9600bps
  Serial1.begin(9600);     // start serial1 communication at 9600bps
  Serial.flush();
  Serial1.flush();
  
} // End Setup


// LOOP *************************************************************************

  int on_off=0;
void loop()
{
  if(on_off==0){
    on_off=1;
    }
  else{
    on_off=0;
    }
    Serial1.write(on_off/256); //Send the Quotient or "how many times" value
    Serial1.write(on_off%256); //Send the Modulo or Remainder.
    delay(1000); //Wait for the serial port.

}  // End Loop.
