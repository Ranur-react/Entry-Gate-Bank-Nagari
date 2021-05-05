#include <ArduinoJson.h>
int data1=0;
String dataRX;
void setup() {
  Serial.begin(9600);
  pinMode(16,OUTPUT);
}

void loop() {
    StaticJsonDocument<1000> doc;  
  DeserializationError error = deserializeJson(doc, Serial);
  dataRX=doc["data"];
  if (error) return;
  Serial.print(dataRX);
//  if(data1 >= 100){
//    digitalWrite(16,HIGH);
//    delay(300);
//    digitalWrite(16,LOW);
//    delay(300);
//    }else{
//      digitalWrite(16,LOW);
//      }
}
