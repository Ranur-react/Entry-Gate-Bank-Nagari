#include <SPI.h>
#include <Ethernet.h>
#include <ArduinoJson.h>
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED }; 
char server[]="192.168.137.1"; //Domain atau Address WEBSERVER
String host="Host: 192.168.137.1"; //Domain atau Address WEBSERVER
IPAddress ip(192,168,137,2);//IP Address Ethernet Shield
IPAddress  localBoardIP;
EthernetClient client;
//------------------------------------
String Seri_Alat ="Pintu_X1_B2";

 char* dataRX="";

void setup() {
     
  Serial.begin(9600);
  
  Serial.println("Connecting..");
  Ethernet.begin(mac);
  Serial.println("Conncted on Local Network with your IP:");
  localBoardIP=Ethernet.localIP();
  Serial.println(localBoardIP);

  Serial.println("Start");
}

void loop() {
  // put your main code here, to run repeatedly:

}
