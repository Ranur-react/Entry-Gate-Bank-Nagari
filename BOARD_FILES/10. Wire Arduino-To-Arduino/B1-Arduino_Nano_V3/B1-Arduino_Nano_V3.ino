// SETUP *************************************************************************
char data="";
#include <ArduinoJson.h>
void setup(){

  Serial.begin(9600);       //Start serial communication at 9600bps
} //End Setup

// LOOP *************************************************************************
StaticJsonDocument<200> doc;
void loop()
{
  if(data==NULL){
//    data="RahmatNur28";
    doc["data"]="RahmatNur28";
    }else{
      data="";
      }
//Serial.write(doc["data"]);
serializeJsonPretty(doc, Serial);
delay(1000); 
} //End Loop
