float rad = 20;
void setup() {
  size(500, 500);
  rectMode(CENTER);
}
void draw() {
  //background(0);
  int cx = width/2, cy = height/2;
  float angle = frameCount*0.01;

  fill(255, 0, 0);
  ellipse(cx, cy, 10, 10);
  float x = cx + cos(angle)* rad;
  float y = cy + sin(angle)* rad;
  fill(255);
  rect(x, y, 5, 5);
  rad +=0.05;
}