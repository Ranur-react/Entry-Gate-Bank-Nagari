#include <ESP8266WiFi.h>
#include <ESP8266mDNS.h>
#include <WiFiUdp.h>
#include <ArduinoOTA.h>
//socket 
#include <Bridge.h>
#include <YunClient.h>
YunClient client;
char incomingByte;
static boolean clientActive = false;
//---
#ifndef STASSID
#define STASSID "PARKING_SYSTEM"
#define STAPSK  "Padri1998"
#endif

const char* ssid = STASSID;
const char* password = STAPSK;

void setup() {
  Serial.begin(115200);
  Serial.println("Booting");
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  while (WiFi.waitForConnectResult() != WL_CONNECTED) {
    Serial.println("Connection Failed! Rebooting...");
    delay(5000);
    ESP.restart();
  }

  Serial.println("Ready");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
}

void loop() {
  Serial.print("Loop");
  ReadPCless();
  delay(1000);
}
byte ip[] = {192, 168, 137, 103 };
void ReadPCless(){
   client.connect(ip,5003);
    if (client.connected()){
      Serial.println("Client connect.");
      if (!clientActive)
       Serial.println("New Client connection.");
       clientActive = true;
       if (client.available()){
        incomingByte == client.read();
        Serial.print("From client: \"");
         while(client.available())
          Serial.print((char)client.read());
          Serial.println("\"");
       }
    }else{
      Serial.println("Client Unconnect.");
    }
  }
