import processing.sound.*;
import processing.serial.*;
boolean show=false;
String [] note = {"c3", "d3", "e3", "f3", "g3", "a4", "b4", "c4", "d4", "e4", "f4", "g4", "a5", "b5", "c5","c-3", "d-3", "f-3", "g-3", "a-4", "c-4", "d-4", "f-4", "g-4", "a-5"};
char pitch=' ';
int lapse=0;
SoundFile[] sounds= new SoundFile[note.length];
Serial port;


void preload()
{
   for (int i = 0; i < note.length; i++) {
     println(i);
   sounds[i] =  new SoundFile(this,note[i] + ".mp3");
   }

}


void setup() {
  port =new Serial(this,"/dev/cu.usbserial-1420",9600);
  size(800,600);
  background(255);
  preload();
  
}      

void draw() {
  serialEvent();
 textSize(height / 40);
  for (int i = 0; i < 15; i++) {
    //when the tile is tragged fill the gray else fill white
    if (sounds[i].isPlaying())
      fill(200);
    else
      fill(255);
    rect((i + 2) * width / 18, height / 3, width / 18, height / 2, 10);
    fill(0);
    

  }
  //draw the black tile
  for (int i = 0; i < 14; i++) {
    if (i != 2 && i != 6 && i != 9 && i != 13) {
      fill(0);
      rect((i + 3) * width / 18 - width / 60, height / 3, width / 30, height / 4, 10);
    }
}}


void serialEvent() { 
  pitch = port.lastChar(); 
  if (pitch=='1')
  { sounds[7].play();}
  if (pitch=='2')
  { sounds[8].play();}
  if (pitch=='3')
  { sounds[9].play();}
  if (pitch=='4')
  { sounds[11].play();}
  if (pitch=='5')
  { sounds[12].play();}
  
} 
