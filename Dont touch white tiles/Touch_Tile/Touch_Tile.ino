#define finger1 A1
#define finger2 A2
#define finger3 A3
#define finger4 A4

void setup() {
  // put your setup code here, to run once:
  pinMode(finger1,INPUT);
  pinMode(finger2,INPUT);
  pinMode(finger3,INPUT);
  pinMode(finger4,INPUT);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
if(analogRead(finger1)>770)
{Serial.write("1");}
if(analogRead(finger2)>800)
{Serial.write("2");}
if(analogRead(finger3)>770)
{Serial.write("3");}
if(analogRead(finger4)>760)
{Serial.write("4");}
    
delay(50);

}
