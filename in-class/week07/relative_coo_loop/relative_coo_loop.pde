float rad = 20;
void setup() {
  size(500, 500);
  rectMode(CENTER);
}
void draw() {
  noLoop();
  background(255);
  int cx = width/2, cy = height/2;

  translate(cx, cy);

  //center
  fill(255, 0, 0);
  ellipse(0, 0, 5, 5);
  //rect on the ring
  for (int angle = 0; angle < 360; angle ++) {
    pushMatrix();
    rotate(radians(angle));
    fill(255);
    rect(rad, 0, 5, 5);
    popMatrix();
    rad +=0.05;
  }
}