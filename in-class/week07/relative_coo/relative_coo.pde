float rad = 20;
void setup() {
  size(500, 500);
  rectMode(CENTER);
}
void draw() {
  //background(0);
  int cx = 100, cy = 100;
  float angle = frameCount*0.01;
  
  translate(cx, cy);
  fill(255, 0, 0);
  ellipse(0, 0, 5, 5);
  rotate(angle);
  fill(255);
  rect(rad, 0, 5, 5);
  rad +=0.05;
}