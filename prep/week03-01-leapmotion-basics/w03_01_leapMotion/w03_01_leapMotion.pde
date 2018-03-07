//Aven,03/12/2017
//Interactive Installation
//New Media, WPP, SADA


float fingerX, fingerY;


void setup() {
  // OPENGL(depricated) to P3D
  size(800, 500, P3D);
  background(255);
  noStroke();
  LeapSetup();
}


void draw() {
  background(255);
  LeapRun();
  
  fill(255,0,0,200);
  ellipse(fingerX, fingerY, 30,30);
}