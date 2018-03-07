//Aven,03/04/2017
//Interactive Installation
//New Media, WPP, SADA

int a = 0, b = 0;
void setup() {
  size(300, 300);
  background(0);
}

void draw() {
  if (keyPressed) {
    a ++;
    //println("key is pressed" + a);    
  }
}

void keyPressed() { // run once
  b++;
  //println("hey key is pressed" + b);
  if(key == 'p'){ // keyCode
    // audio.play();
   println("play music");

  }
}

void keyReleased() {
  println("key is released");
  //audio.pause();
}

void keyTyped() {
  //println("key is typed");
}