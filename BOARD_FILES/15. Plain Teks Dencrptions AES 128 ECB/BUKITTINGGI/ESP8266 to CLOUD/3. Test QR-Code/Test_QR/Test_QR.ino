
#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>
ESP8266WiFiMulti WiFiMulti;


int Public_data;

int accesst(String val) {

    if ((WiFiMulti.run() == WL_CONNECTED)) {
    WiFiClient client;
    HTTPClient http;
    if (http.begin(client, val)) { 
      int httpCode = http.GET();
      if (httpCode > 0) {
        if (httpCode == HTTP_CODE_OK || httpCode == HTTP_CODE_MOVED_PERMANENTLY) {
            int data;
          String payload = http.getString();
          data=payload.toInt();
            return data;
        }
      } else {
      }
      http.end();
    } else {
    }
  }
  }
void setup() {
  Serial.begin(9600);
  for (uint8_t t = 4; t > 0; t--) {
    delay(1000);
  }
  WiFi.mode(WIFI_STA);
  WiFiMulti.addAP("Adr", "awwwwwww");
  pinMode(2, OUTPUT);

}
void loop() {
 while (Serial.available() > 0) {
    kode = Serial.readString();
    delay(1000);
      digitalWrite(2,HIGH);
      delay(1000);
        digitalWrite(2,LOW);
  }
}

 
