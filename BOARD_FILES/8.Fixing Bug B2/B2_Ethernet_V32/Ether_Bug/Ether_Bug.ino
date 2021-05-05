

#include <SPI.h>
#include <Ethernet.h>

#include <Arduino.h> 
#include <ArduinoJson.h>
char server[]="192.168.137.1"; //Domain atau Address WEBSERVER
String host="Host: 192.168.137.1"; //Domain atau Address WEBSERVER
EthernetClient client;
//------------------------------------
byte mac[] = {
  0x00, 0xAA, 0xBB, 0xCC, 0xDE, 0x02
};

String Seri_Alat ="Pintu_X1_B2";

 char* dataRX="";
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
                                int indexBatasAwal=data.indexOf("_start_");
                Serial.println("Mulai Karakter String seharusnya: ");
                               String returnFromServer=data.substring(indexBatasAwal+8);
                Serial.println(returnFromServer);
                                return returnFromServer;

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
 
  Serial.begin(9600);
  while (!Serial) {
  }

  Serial.println("Initialize Ethernet with DHCP:");
  if (Ethernet.begin(mac) == 0) {
    Serial.println("Failed to configure Ethernet using DHCP");
    if (Ethernet.hardwareStatus() == EthernetNoHardware) {
      Serial.println("Ethernet shield was not found.  Sorry, can't run without hardware. :(");
    } else if (Ethernet.linkStatus() == LinkOFF) {
      Serial.println("Ethernet cable is not connected.");
    }
    while (true) {
      delay(1);
    }
  }
  Serial.print("My IP address: ");
  Serial.println(Ethernet.localIP());

    Serial.println("Start------------------------>");
}

void loop() {
//    DynamicJsonDocument JsonVariabel(1024);
//    deserializeJson(JsonVariabel, Serial);  
//    JsonObject obj = JsonVariabel.as<JsonObject>();
//    Serial.print(obj);
//      StaticJsonDocument<1000> doc;  
//      DeserializationError error = deserializeJson(doc, Serial);
//      dataRX=doc["data"];
//      if (error) return;
//      Serial.println("--Dapet--");
String a="";
 while(Serial.available()){
 a=Serial.readString();
   GetFromDb(a);
  }


}
