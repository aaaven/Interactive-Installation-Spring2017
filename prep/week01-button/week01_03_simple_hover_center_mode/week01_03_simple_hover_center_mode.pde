//Aven,02/26/2017
//Interactive Installation
//New Media, WPP, SADA

color buttonColor = color(100);
int w = 100, h=50;

void setup() {
  size(400, 400);
  stroke(0);
  strokeWeight(1);
  rectMode(CENTER);
}

void draw() {
  background(100);
  fill(buttonColor);
  rect(width/2,height/2,w,h);
  if (mouseX > (width-w)/2 && mouseX < (width+w)/2 &&
    mouseY > (height-h)/2 && mouseY < (height+h)/2) {
    buttonColor = color(255, 0, 0);
  } else {
    buttonColor = color(100);
  }
}