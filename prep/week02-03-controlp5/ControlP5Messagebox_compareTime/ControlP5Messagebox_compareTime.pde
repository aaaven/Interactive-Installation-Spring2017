//Aven,03/04/2017

void setup() {
  size(640, 480, P3D);
  noStroke();
  setupControlP5();
}
void draw() {
  messageBox();
  int inputTime = 60 * h + m;
  //println("start to work at: " + inputTime);
  int time = 60 * hour() + minute();
  //println("now: " + time);
  if (inputTime > time) {// not late
    //send data 'S'
    //myPort.write('S');
    println("S");
  } else {//late
    //send data 'R'
    println("R");
  }
}