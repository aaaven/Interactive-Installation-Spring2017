//Aven,03/12/2017
//Interactive Installation
//New Media, WPP, SADA


float pFinger1X, pFinger1Y;
float finger1X, finger1Y;
float pFinger2X, pFinger2Y;
float finger2X, finger2Y;
void setup() {
  size(800, 500);
  background(255);
  LeapSetup();
}
void draw() {
  LeapRun();
  
//---------here is the drawing area--------------

  drawStuff(pFinger1X, pFinger1Y, finger1X, finger1Y);
  
//---------here is the drawing area--------------

  // update pmouseX, pmouseY-previous finger position
  pFinger1X = finger1X;
  pFinger1Y = finger1Y;

  pFinger2X = finger2X;
  pFinger2Y = finger2Y;
}

void drawStuff(float px, float py,float x, float y) {

  // distance between thumb and index
  float distance = dist(x, y, px, py);
  if (distance < 30) {
    background(255);
  }
  // distance between previous and current index position 
  float accel = dist(x, y, px, py);
  stroke(255, 0, 0, 200);
  strokeWeight(accel*0.6);
  line(px, py, x, y);
}