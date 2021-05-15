void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
}

long lCnt = 0;
unsigned long lStart;
void loop()
{
    int loopcount=0;
    long starttime = millis();
    long endtime = starttime;
    while((endtime - starttime) <= 2000 ) // do this loop for up to 1000mS
    {
    // code here
    loopcount = loopcount+1;
    endtime = millis();
    Serial.println("Test Loop Timer");
    }
    Serial.print (loopcount,DEC);
    delay(3000);
    Serial.println("Finis");
}
