//Aven,03/12/2017
//Interactive Installation
//New Media, WPP, SADA


float finger1X, finger1Y;
float finger2X, finger2Y;


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
  
  float distance  = dist(finger1X, finger1Y,finger2X,finger2Y);
  noStroke();
  fill(255,0,0,200);
  ellipse(finger1X, finger1Y, distance,distance);
  
  fill(255,255,0,200);
  ellipse(finger2X, finger2Y, distance,distance);
  
  stroke(0,255,255);
  strokeWeight(7);
  line(finger1X, finger1Y,finger2X, finger2Y);
}