float rad = 20;
void setup() {
  size(500, 500);
  rectMode(CENTER);
}
void draw() {
  noLoop();
  background(255);
  int cx = width/2, cy = height/2;

  //center
  fill(255, 0, 0);
  ellipse(cx, cy, 10, 10);
  //rect on the ring
  for (int angle = 0; angle < 360; angle ++) {
    float x = cx + cos(radians(angle))* rad;
    float y = cy + sin(radians(angle))* rad;
    fill(255);
    rect(x, y, 5, 5);
    rad +=0.05;
  }
}