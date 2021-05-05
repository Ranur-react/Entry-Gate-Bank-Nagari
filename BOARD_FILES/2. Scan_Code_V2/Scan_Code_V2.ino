

#include <hidboot.h>
#include <hiduniversal.h>

String DataBarcode;
String Enter;
bool x = true;

class KbdRptParser : public KeyboardReportParser
{
    void PrintKey(uint8_t mod, uint8_t key);

  protected:
    void OnControlKeysChanged(uint8_t before, uint8_t after);

    void OnKeyDown  (uint8_t mod, uint8_t key);
    void OnKeyUp  (uint8_t mod, uint8_t key);
    void OnKeyPressed(uint8_t key);
};

void KbdRptParser::PrintKey(uint8_t m, uint8_t key)
{
  MODIFIERKEYS mod;

}

void KbdRptParser::OnKeyDown(uint8_t mod, uint8_t key)
{
  PrintKey(mod, key);
  uint8_t c = OemToAscii(mod, key);
  if (c)
    OnKeyPressed(c);

}

void KbdRptParser::OnControlKeysChanged(uint8_t before, uint8_t after) {
  MODIFIERKEYS beforeMod;
  *((uint8_t*)&beforeMod) = before;

  MODIFIERKEYS afterMod;
  *((uint8_t*)&afterMod) = after;
}

void KbdRptParser::OnKeyUp(uint8_t mod, uint8_t key)
{
//  Serial.print("UP ");
//  PrintKey(mod, key);
}

void KbdRptParser::OnKeyPressed(uint8_t key)
{
  //Serial.print((char)key);
  if (key == 0x0D){
    x = false;
  }else{
    Enter+=key;
    DataBarcode += (char)key;
  }
}


USB Usb;
HIDUniversal Hid(&Usb);

KbdRptParser Prs;

void setup()
{
  Serial.begin( 9600 );
  Serial.println("Start");
  pinMode(14, OUTPUT);
  digitalWrite(14, HIGH);
  if (Usb.Init() == -1)
    Serial.println("OSC did not start.");
  delay( 200 );
  Hid.SetReportParser(0, &Prs);
}

void loop()
{
  Serial.println("Mulai Scan..");

  String Value="";
    while(x){
        Usb.Task();
        if(DataBarcode != NULL){
          Value.concat(DataBarcode);
          Serial.print(DataBarcode);
          DataBarcode = "";
           }
      }
      x=true;
      
Serial.println("");
Serial.println("Selesai....");
Serial.println("Kode : "+Value);

if(Value == "8991906101361"){
     Serial.println("Data BENAR");
     digitalWrite(14, LOW);
     delay(100);
     digitalWrite(14, HIGH);
  }else{
    Serial.println("Data SALAH");
    digitalWrite(14, HIGH);
    }

}
