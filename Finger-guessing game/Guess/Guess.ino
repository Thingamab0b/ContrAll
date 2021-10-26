#define finger3 A2
#define finger4 A3

void setup() {
  // put your setup code here, to run once:
  pinMode(finger3,INPUT);
  pinMode(finger4,INPUT);
  Serial.begin(9600);
  
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
        Serial.write("1");
        //Serial.print("石头\n");
        }
     else if (analogRead(finger3)>750 && analogRead(finger4)<750) //剪刀
      {
        Serial.write("2");
        //Serial.print("剪刀\n");
        }
     else if (analogRead(finger3)<750 && analogRead(finger4)<750) //布
      {
        Serial.write("3");
        //Serial.print("3布\n");
        
        }
     else {
       Serial.write("0");
      //Serial.print("你犯规咯\n");
      
      };
     delay(50);
}
