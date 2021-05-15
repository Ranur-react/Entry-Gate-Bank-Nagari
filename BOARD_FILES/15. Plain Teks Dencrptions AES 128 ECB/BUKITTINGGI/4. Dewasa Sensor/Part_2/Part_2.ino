// defines variables Sensor Ultra Sonic---------
const int trigPin = 17;
const int echoPin = 16;
long duration;
int distance;
//--------------------------------------------

boolean dewasa=false;
void distance_sensor(){
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  duration = pulseIn(echoPin, HIGH);
  distance= duration*0.034/2;
   Serial.print("Disatance: ");
  Serial.println(distance);
}



void setup() {
    Serial.begin(9600);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
}

void loop() {
distance_sensor();
if (distance<60){
  delay(200);
  if (distance<60){
      Serial.println("Adult Man Detected");
      dewasa=true;
//      ----------------------------------------
      while(dewasa){
        distance_sensor();
        if (distance>60){
          Serial.print("Tak ada orang");
          }
        }
//-------------------------------------------------------
        Serial.println("childs . . .");
    }
  }
 
}
