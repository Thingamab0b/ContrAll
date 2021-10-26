#include "SoftwareSerial.h"
#define tx 2
#define rx 3
SoftwareSerial bt(rx,tx); //RX, TX
#define finger3 A2
#define finger4 A3


void setup() {
  // put your setup code here, to run once:
  pinMode(finger3,INPUT);
  pinMode(finger4,INPUT);
  Serial.begin(9600);
  bt.begin(9600);
  pinMode(tx, OUTPUT);
  pinMode(rx, INPUT);
  
}

void loop() {
  // put your main code here, to run repeatedly:
//    Serial.print("无名指=");
//    Serial.print(analogRead(finger3));
//    Serial.print("\n");
//    Serial.print("中指=");
//    Serial.print(analogRead(finger4));
//    Serial.print("\n"); 
//    delay(500);

    if (analogRead(finger3)>750 && analogRead(finger4)>750) //石头
      {
        bt.print('1');
        //bt.print("石头\n");
        }
     else if (analogRead(finger3)<750 && analogRead(finger4)>750) //剪刀
      {
        bt.print('2');
        //bt.print("剪刀\n");
        }
     else if (analogRead(finger3)<750 && analogRead(finger4)<750) //布
      {
        bt.print('3');
        //bt.print("3布\n");
        
        }
     else {
       bt.print('0');
      //bt.print("你犯规咯\n");
      
      };
     delay(50);
}
