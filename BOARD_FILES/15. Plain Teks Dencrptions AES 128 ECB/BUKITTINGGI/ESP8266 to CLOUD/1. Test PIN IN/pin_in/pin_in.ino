
#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>
ESP8266WiFiMulti WiFiMulti;

int Public_data;

void setup() {
  Serial.begin(9600); 
  for (uint8_t t = 4; t > 0; t--) {
    delay(1000);
  }
  WiFi.mode(WIFI_STA);
  WiFiMulti.addAP("Adr", "awwwwwww");
  pinMode(2, OUTPUT);
  digitalWrite(2,HIGH);
}
void loop() {
 digitalWrite(2,HIGH);
 delay(1000);
 digitalWrite(2,LOW);
 delay(1000);
}
