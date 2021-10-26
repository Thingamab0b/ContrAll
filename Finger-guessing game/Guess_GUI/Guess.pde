import processing.serial.*;
import gifAnimation.*;
Serial port;
Gif myAnimation,count;
char Pos;
boolean start = false,flag=false;
PImage start_img,response1,response2,response3,response0;

void setup()
{
  port =new Serial(this,"/dev/cu.usbserial-1420",9600);
  size(500,500);
  start_img = loadImage("Start.jpeg");
  myAnimation = new Gif(this, "Gif.gif");
  count=new Gif(this,"count.gif");
  response1= loadImage("response1.png");
  response2= loadImage("response2.png");
  response3= loadImage("response3.png");
  response0= loadImage("response0.jpeg");
  
  myAnimation.loop();


}


void gameStart(){
  image(start_img, 0, 0,500,500);
  noStroke();
  
  fill(0,145,224);
  rect(30,60,440,50,10);

  textAlign(CENTER,TOP);
  fill(255,255,255);
  text("Are U Ready to Lose?",250,60);
  
  if(mouseX>150 && mouseX<350 && mouseY>400 && mouseY<450){
    fill(0,0,0);
    rect(150,400,200,50,10);
    
    textSize(40);
    fill(255,255,255);
    text("START",250,400);

  }
  else{
    fill(255,255,255);
    rect(150,400,200,50,10);
    
    textSize(40);
    fill(0,0,0);
    text("START",250,400);
    
  }
}

void mousePressed(){
  if(mousePressed&&start==false){
  start=true;
  count.play();}
  else if(mousePressed&&start==true)
  {
    start = false;
    flag=false;
  }

}

void draw()
{
gameStart();
mousePressed();

if(start == true){

    image(myAnimation,0,0,500,500);
    image(count,200,350,100,100);

    if(flag==false){
     Pos  = port.lastChar();//读字符串，直到出现换行符后，将字符串赋值给Pos变量
     println(Pos);

}
    if(count.isPlaying()==false)
    {
    if(Pos=='1'||Pos=='2'||Pos=='3'||Pos=='0'){
    if(Pos=='1'){image(response3,0,0,500,500);}
    else if(Pos=='2'){image(response1,0,0,500,500);}
    else if(Pos=='3'){image(response2,0,0,500,500);}
    else {image(response0,0,0,500,500);}   
    flag=true;}
    }

 
 }
  
}
