import processing.serial.*;
final int tiles_in_row = 4;
final int tiles_in_col = 5;
final char keys[] = new char[]{'1', '2', '3', '4'};
char mykey=' ',lastkey=' ';

final int redness_speed = 50;
float redness[] = new float[tiles_in_row];
int it = 0, last, score = 0, m_score = 0;
boolean pressed[] = new boolean[]{false, false, false, false};

Serial port;
Tile tiles[] = new Tile[7];
float speed = 5;


void setup() {
  port =new Serial(this,"/dev/cu.usbserial-1420",9600);
  size(400, 700);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(255);
  //Updating tiles
  noStroke();
  for (int i = 0; i < tiles.length; i++) {
    if (tiles[i] != null) {
      tiles[i].move();
      tiles[i].display();
      if (tiles[i].kill_me_please) {
        if (i == last) {
          last = (i + 1) % tiles.length;
          redness[tiles[i].row] = HALF_PI;
          score = 0;
        }
        tiles[i] = null;
      }
    }
  }
  //Lines-separators
  stroke(127);
  for (int x = 0; x < tiles_in_row; x++) {
    line(x*width/tiles_in_row, 0, x*width/tiles_in_row, height);
  }
  line(tiles_in_row*width/tiles_in_row-1, 0, tiles_in_row*width/tiles_in_row-1, height);
  //Redness handle
  for (int x = 0; x < tiles_in_row; x++) {
    if (redness[x] > 0) {
      fill(255, 0, 0, sin(redness[x])*200);
      rect(x*(width/tiles_in_row), 0, width/tiles_in_row, height);
      redness[x] -= speed/redness_speed;
      if (redness[x] < 0) {
        redness[x] = 0;
      }
    }
  }
  //New tiles
  if (frameCount % int(height/tiles_in_col/speed) == 0) {
    tiles[it] = new Tile(int(random(tiles_in_row)), it);
    it = (it + 1) % tiles.length;
  }
  //Score
  fill(0);
  textSize(30);
  text("Score: "+score,width/2,height-40);
    textSize(15);

    text("Max score: "+m_score,width/2,height-20);
     Pressed();
}

void Pressed() {
  lastkey=mykey;
  mykey = port.lastChar(); 
  println(mykey);
  for (int i = 0; i < pressed.length; i++) {
    if (keys[i]== mykey && pressed[i] == false) {
      pressed[i] = true;
      if (tiles[last] != null) {
        if (tiles[last].row == i) {
          tiles[last].pressed = true;
          last = (last + 1)% tiles.length;
          score++;
          if (score >= m_score){
          	m_score = score;
          }
        } else {
          redness[i] = HALF_PI;
          score = 0;
        }
      }
    }
   if(lastkey=='1'||lastkey=='2'||lastkey=='3'||lastkey=='4')
   {if (lastkey!= mykey && pressed[int(lastkey)-49] == true) {
     pressed[int(lastkey)-49] = false;}}
  } 
}


class Tile {
  int row, index;
  float y;
  boolean kill_me_please, pressed;

  Tile(int _row, int _index) {
    row = _row;
    index = _index;
    y = -height/tiles_in_col;
  }

  void display() {
    //Tile itself
    if (pressed) {
      fill(127);
    } else {
      fill(0);
    }
    rect(row*width/tiles_in_row, y, width/tiles_in_row, height/tiles_in_col);
    //Draw a key if tile is about to be pressed
    if (index == last) {
      fill(255);
        textSize(40);
    }
  }

  void move() {
    y += speed;
    //If tile is gone, delete it
    if (y>=height) {
      kill_me_please = true;
    }
  }
}
