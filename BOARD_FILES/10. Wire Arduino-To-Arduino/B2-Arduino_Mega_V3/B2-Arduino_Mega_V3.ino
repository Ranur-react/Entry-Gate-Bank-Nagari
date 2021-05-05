#include <ArduinoJson.h>

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


  
char dataStringFromB2="";
Serial.println("Waiting data . . .");
  while(Serial1.available()>0) //Wait for 2 bytes to arrive
  {
        StaticJsonDocument<200> doc;  
        deserializeJson(doc, Serial1);
//          if (!error) {
                Serial.println("Serial Nyambung");
                
//                dataStringFromB2=Serial1.read();
                   dataStringFromB2=doc["data"];
                Serial.println("Data String di dapatkan: ");
                Serial.println(dataStringFromB2);
                delay(1000);
//            }else{
//              Serial.println("Json Deserialize Filed . . . !");
//              }
        
    
  } //End While
    delay(1000);
}  // End Loop.
