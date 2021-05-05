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
  
  Serial.println("Connecting..");
  Ethernet.begin(mac,ip);
  Serial.println("Conncted on Local Network with your IP:");
  localBoardIP=Ethernet.localIP();
  Serial.println(localBoardIP);

  Serial.println("Start");
  
  
}
 
void loop() {
//GetFromDb("satu");
}

  
