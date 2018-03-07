//Aven,03/04/2017
//Interactive Installation
//New Media, WPP, SADA

float speed;
float pos;
float c0, c1, c2, c3;
boolean auto;

void draw() {
  if (auto) pos += speed;
  background(0);
  translate(width/2, height/2);
  rotateY(pos);
  lights();
  fill(c0, c1, c2, c3);
  box(100);
}