//Aven,02/26/2017
//Interactive Installation
//New Media, WPP, SADA


float x1, y1, size1 = 50, x2, y2, size2 = 30;
color button1Color = color(100);
color button2Color = color(100);

void setup() {
  size(400, 400);
  stroke(0);
  strokeWeight(1);
  x1 = width/2;
  y1 = height/2;
  x2 = width/2 + 100;
  y2 = height/2;
}


void draw() {
  background(100);
  //size = sin(frameCount*0.02)*60 + 90;
  fill(button1Color);
  ellipse(x1, y1, size1, size1);
  fill(button2Color);
  ellipse(x2, y2, size2, size2);

  int check1 = checkDistance(x1, y1, size1);
  switch(check1) {
  case 0:
    button1Color = color(100);
    break;
  case 1:
    button1Color = color(255, 0, 0);
    break;
  case 2:
    button1Color = color(random(255), random(255), random(255));
    break;
  }
  
  int check2 = checkDistance(x2, y2, size2);
  switch(check2) {
  case 0:
    button2Color = color(100);
    break;
  case 1:
    button2Color = color(255, 0, 0);
    break;
  case 2:
    button2Color = color(random(255), random(255), random(255));
    break;
  }
}

int checkDistance(float _x, float _y, float _size) {
  int result = 0;
  float distance = dist(_x, _y, mouseX, mouseY);
  if ( distance < _size/2) { //mouse hover
    result = 1;
    if (mousePressed) {
      result = 2;
    }
  } else {
    result = 0;
  } 
  return result;
}