String kode;

void setup() {
  Serial.begin(9600);
  
  Serial1.begin(9600);
  Serial1.setTimeout(100);
}

void loop() {
  while (Serial1.available() > 0) {
    kode = Serial1.readString();
    Serial.println(kode);
  }
}
