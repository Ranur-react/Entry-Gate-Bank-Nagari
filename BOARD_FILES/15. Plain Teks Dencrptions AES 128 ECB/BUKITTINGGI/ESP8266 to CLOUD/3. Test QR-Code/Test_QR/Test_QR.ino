
#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>
ESP8266WiFiMulti WiFiMulti;
#include<SoftwareSerial.h>
SoftwareSerial myserial(4,12);

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
  Serial.println("Ready");
 myserial.begin(9600);
  myserial.setTimeout(100);
}
String kode="";
void loop() {
 while (myserial.available() > 0) {
  kode="";
    kode = myserial.readString();
    Serial.println("Respond:");
    Serial.println(kode);
        accesst("http://114.7.96.242/Entry-Gate-Bank-Nagari/GATE_TIKET/testqr.php?data="+kode);
  }
}

 
