//Aven,05/23/2017
//See Through Kinect --> depth image templete

boolean debug = true;
PImage depthImg;

void setup() {
  //size(512, 424, P2D);
  fullScreen();
  setupCP5();
  setupKinect();
}


void draw() {
  updateKinect();
  background(100);
  image(kinect2.getVideoImage(), 0, 0);
  if (debug) drawGUI();
}