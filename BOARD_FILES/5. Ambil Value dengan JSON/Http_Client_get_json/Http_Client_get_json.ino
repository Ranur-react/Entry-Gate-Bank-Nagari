#include <SPI.h>
#include <Ethernet.h>
#include <ArduinoJson.h>
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED }; 
char server[]="192.168.137.1"; //Domain atau Address WEBSERVER
String host="Host: 192.168.137.1"; //Domain atau Address WEBSERVER
//IPAddress ip(192,168,137,2);//IP Address Ethernet Shield
EthernetClient client;
//------------------------------------
String Seri_Alat ="Pintu_X1_B2";

void GetFromDb(String valueGet){
   
     valueGet.trim();    
     Cetak("S","Log Value");
     Cetak("S",valueGet);
     Cetak("S",Seri_Alat);
     
    if (client.connect(server, 80)) {    
        Cetak("S","GET Connect");
        client.println("GET /banknagari/tambah.php?data="+valueGet+"&asal="+Seri_Alat+" HTTP/1.1");
        client.println(host);
        client.println("Connection: close");
        client.println();
         delay(100);
                String data= client.readString();
                Serial.println(data);

// Skip HTTP headers
//  char endOfHeaders[] = "\r\n\r\n";
//  if (!client.find(endOfHeaders)) {
//    Serial.println(F("Invalid response"));
//    return;
//  }

  // Allocate JsonBuffer
  // Use arduinojson.org/assistant to compute the capacity.
  
 StaticJsonBuffer<200> jsonBuffer;
JsonObject& root = jsonBuffer.parseObject(client);

//JsonObject& root = parseObject(client);
if (!root.success()) {
    Serial.println(F("Parsing failed!"));
    return;
  }
    Cetak("S","Data Json yang didapatkan");
 Serial.println(F("Response:"));
  Serial.println(root["data"].as<char*>());

    
//  String datJson=doc["data"];
//  Cetak("S",datJson);
  

    }else{
     Cetak("S","Connections Filed ..!!");
     delay(1000);
    }
    client.stop();
    }

    
 void Cetak(String Display,String Value){
  if(Display == "S"){
  Serial.println(Value);
    }else{
      //print with Other Display
      }
  }
void setup() {

  Ethernet.begin(mac);
  Serial.begin(9600);
}
 
void loop() {
  
GetFromDb("02281998");
delay(200);
}

  
