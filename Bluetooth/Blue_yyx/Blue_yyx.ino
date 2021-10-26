char var;
void setup()

{
Serial.begin(9600);
}

void loop()
{
if(Serial.available()>0)
{
var=Serial.read();
Serial.print(var);
}

}
