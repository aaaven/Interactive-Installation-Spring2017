//Aven,05/16/2017
//get closet point and store in a PVector closet 

void setup() {
  fullScreen();
  setupCP5();
  setupKinect();
}

void draw() {
  background(100);
  drawKinectRegistered();
}