#include <SoftwareSerial.h>  
  SoftwareSerial ser(0,1);
  void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
//  while (!Serial) {
//    ; // wait for serial port to connect. Needed for Native USB only
//  }
  ser.begin(9600);
}

void loop() {
char data='12';
//  ser.println("Hello, world?");
//
//  if (ser.available())
//    Serial.write(ser.read());
//  if (Serial.available())
 if (ser.available())
    ser.write(data);
    delay(10000);
}
