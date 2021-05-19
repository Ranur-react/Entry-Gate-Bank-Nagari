const int trigPin = 17;
const int echoPin = 16;
long duration;
int distance;
//--------------------------------------------
void distance_sensor(){
  // Clears the trigPin
digitalWrite(trigPin, LOW);
delayMicroseconds(2);
// Sets the trigPin on HIGH state for 10 micro seconds
digitalWrite(trigPin, HIGH);
delayMicroseconds(10);
digitalWrite(trigPin, LOW);
// Reads the echoPin, returns the sound wave travel time in microseconds
duration = pulseIn(echoPin, HIGH);
// Calculating the distance
distance= duration*0.034/2;
// Prints the distance on the Serial Monitor
//Serial.print("Distance: ");
//Serial.println(distance);
//return distance;
}
 void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Input
  // put your setup code here, to run once:

}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.print("Disatance: ");
distance_sensor();
Serial.println(distance);
if (distance<60){
  delay(200);
  if (distance<60){
      Serial.println("Adult Man Detected");
//      countDataAdultDB();
        delay(100);
      while(true){

        distance_sensor();
        if (distance>60){
          Serial.print("Tak ada orang");
          break;
          }
        }
    }
  }
}
