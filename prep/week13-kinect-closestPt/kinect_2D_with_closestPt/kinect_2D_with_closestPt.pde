//Aven,05/16/2017
//get closet point and use as button 

void setup() {
  fullScreen();
  setupCP5();
  setupKinect();
  button = new Button(1200);
}

void draw() {
  background(100);
  drawKinect();
}