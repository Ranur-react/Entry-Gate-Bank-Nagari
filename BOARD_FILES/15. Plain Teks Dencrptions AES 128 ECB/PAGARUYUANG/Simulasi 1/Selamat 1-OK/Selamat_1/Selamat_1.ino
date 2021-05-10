#include <SPI.h>
#include <Ethernet.h>
#include <ArduinoJson.h>
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED }; 
char server[]="192.168.100.100"; //Domain atau Address WEBSERVER
String host="Host: 192.168.100.100"; //Domain atau Address WEBSERVER
//IPAddress ip(192,168,137,2);//IP Address Ethernet Shield
IPAddress  localBoardIP;
EthernetClient client;
//------------------------------------

int GateCOM=20;
int GateCOM2=21;
String kode="";
boolean state=false;
  void ToBoolean(String value)
    {
        if(value =="true" ){
          
          state=true;
          }else{
            state=false;  
          }
    }
 void Cetak(String Display,String Value){
  if(Display == "S"){
  Serial.println(Value);
    }else{
      //print with Other Display
      }
  }

void GetFromDb(String value){
   
     value.trim();    
     String valueGet="data="+value;
     Cetak("S","Log Value");
     Cetak("S",valueGet);
     
    if (client.connect(server, 80)) {    
        Cetak("S","POST Connect");
        client.println("POST /banknagari/Entry-Gate-Bank-Nagari/GATE_TIKET/index.php HTTP/1.1");
        client.println(host);
        client.println("Content-Type: application/x-www-form-urlencoded");
        client.println("Connection: close");
        client.print("Content-Length: ");
        client.println(valueGet.length());
        client.println();
        client.print(valueGet);
        client.println();

        client.println();
         delay(100);
                String data= client.readString();
//                Serial.println(data);
                                int indexBatasAwal=data.indexOf("_start_");
                Serial.println("Mulai Index Karakter String seharusnya: ");
                Serial.println(indexBatasAwal);
                Serial.println("Mulai Karakter String seharusnya: ");
                String json=(String)data.substring(indexBatasAwal+8);
                Serial.println(json);
                ToBoolean(json);

    }else{
     Cetak("S","Connections Filed ..!!");
     delay(100);
    }
    client.stop();
    }




void inisialisasNet(){
//    Ethernet.begin(mac);
//  Serial.println("Conncted on Local Network with your IP:");
//  localBoardIP=Ethernet.localIP();
//  Serial.println(localBoardIP);
//    Serial.println("Conncted on Local Network with your IP:");
//  localBoardIP=Ethernet.localIP();
   if (Ethernet.begin(mac) == 0) {
    Serial.println("Failed to configure Ethernet using DHCP");
    // Check for Ethernet hardware present
    if (Ethernet.hardwareStatus() == EthernetNoHardware) {
      Serial.println("Ethernet shield was not found.  Sorry, can't run without hardware. :(");
      while (true) {
        delay(1); // do nothing, no point running without Ethernet hardware
      }
    }}
    Serial.print("Connected");
}
void setup() {
  Serial.begin(9600); 


//  ----------------Ethernet Intialiting
  Serial.println("Connecting..");
inisialisasNet();
  Serial1.begin(9600);
    Serial1.setTimeout(2000);
    Serial.println("Start");
//  -------------END
pinMode(GateCOM, OUTPUT);
digitalWrite(GateCOM, HIGH);
digitalWrite(GateCOM2, LOW);
}

void loop() {
  while (Serial1.available() > 0) {
    kode = Serial1.readString();
    Serial.println(kode);
    GetFromDb(kode);
  }
  if(state){
      digitalWrite(GateCOM, LOW); 
      digitalWrite(GateCOM2, HIGH);
  delay(100);            // waits for a second
  digitalWrite(GateCOM, HIGH);  // sets the digital pin 13 off
  digitalWrite(GateCOM, LOW);
  state=false;
  delay(1000); 
  }
}
