#include "SoftwareSerial.h"
#define tx 2
#define rx 3
SoftwareSerial bt(rx,tx); //RX, TX

#define finger1 A0
#define finger2 A1
#define finger3 A2
#define finger4 A3
#define finger5 A4

void setup() {
  // put your setup code here, to run once:
  pinMode(finger1,INPUT);
  pinMode(finger2,INPUT);
  pinMode(finger3,INPUT);
  pinMode(finger4,INPUT);
  pinMode(finger5,INPUT);
  Serial.begin(9600);
  bt.begin(9600);
  pinMode(tx, OUTPUT);
  pinMode(rx, INPUT);

  
}

void loop() {
//   put your main code here, to run repeatedly:
//    Serial.println("finger1=");
//    Serial.println(analogRead(finger1));
//    Serial.println("finger2=");
//    Serial.println(analogRead(finger2));
//    Serial.println("finger3=");
//    Serial.println(analogRead(finger3));
//    Serial.println("finger4=");
//    Serial.println(analogRead(finger4));
//    Serial.println("finger5=");
//    Serial.println(analogRead(finger5));

if(analogRead(finger1)>770)
{ bt.print('1');}
if(analogRead(finger2)>770)
{ bt.print('2');}
if(analogRead(finger3)>770)
{ bt.print('3');}
if(analogRead(finger4)>760)
{ bt.print('4');}
if(analogRead(finger5)>760)
{ bt.print('5');}
    
delay(50);
}
