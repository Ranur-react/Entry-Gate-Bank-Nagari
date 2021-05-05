//Tx Board / Send

#include <ArduinoJson.h>
void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
}
StaticJsonDocument<200> doc;
void loop() {
SendtoB2("J12345678910111213");
}
 
void SendtoB2(String V){
  char Data="";
     doc["data"] = V;
  Data=doc["data"];
   Serial.write(Data);
   
// if(Serial.available()>0)
//  {
//    serializeJsonPretty(doc, Serial);
//  }
   Serial.flush();
}
