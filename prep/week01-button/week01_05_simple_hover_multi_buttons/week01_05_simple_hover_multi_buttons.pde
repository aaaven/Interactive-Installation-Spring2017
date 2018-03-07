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

  float distance1 = dist(x1, y1, mouseX, mouseY);
  if ( distance1 < size1/2) { //mouse hover
    button1Color = color(255, 0, 0);
    if (mousePressed) {
      button1Color = color(random(255), random(255), random(255));
    }
  } else {
    button1Color = color(100);
  }
  float distance2 = dist(x2, y2, mouseX, mouseY);
  if ( distance2 < size2/2) { //mouse hover
    button2Color = color(255, 0, 0);
    if (mousePressed) {
      button2Color = color(random(255), random(255), random(255));
    }
  } else {
    button2Color = color(100);
  }
}