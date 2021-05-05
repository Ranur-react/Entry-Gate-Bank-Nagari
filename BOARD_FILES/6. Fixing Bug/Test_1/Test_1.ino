#include <ArduinoJson.h>
#include <SPI.h>
#include <Ethernet.h>

byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED }; 
char server[]="192.168.137.1"; //Domain atau Address WEBSERVER
String host="Host: 192.168.137.1"; //Domain atau Address WEBSERVER
//IPAddress ip(192,168,137,2);//IP Address Ethernet Shield
IPAddress  localBoardIP;
EthernetClient client;
//------------------------------------
String Seri_Alat ="Pintu_X1_B2";

  
//StaticJsonDocument<1000> doc;
DynamicJsonDocument doc(1024);
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
//                Serial.println(data);
                int indexBatasAwal=data.indexOf("_start_");
                Serial.println("Mulai Index Karakter String seharusnya: ");
                Serial.println(indexBatasAwal);
                Serial.println("Mulai Karakter String seharusnya: ");
                String json=data.substring(indexBatasAwal+8);
                Serial.println(json);
                
  deserializeJson(doc, json);
  JsonObject obj = doc.as<JsonObject>();
  String ambil=doc["Data"];
   Serial.println("Hasil");
   Serial.println(ambil);
//String x=doc["data"];
//  Serial.println(x);

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
  
  Serial.println("Connecting..");
  Ethernet.begin(mac);
  Serial.println("Conncted on Local Network with your IP:");
  localBoardIP=Ethernet.localIP();
  Serial.println(localBoardIP);

  Serial.println("Start");
  
}
 
void loop() {
  
GetFromDb("4445X444");
delay(200);
}

  
