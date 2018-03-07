void showCamLookAt() {
  //display camLookAt pos
  fill(0, 255, 255);
  pushMatrix();
  translate(cam.getLookAt()[0], cam.getLookAt()[1], cam.getLookAt()[2]);
  sphere(30);
  popMatrix();
}
void debugDraw() {
  //display world coordinate origin
  fill(0, 0, 255);
  box(30);
  //show origin
  fill(255);
  textSize(150);
  text("World Origin {0,0,0}", 0, 0, 0);

  //drawLine connect origin and srf conner: depthRangeMin
  pushStyle();
  stroke(255, 0, 255);
  strokeWeight(1);
  line(0, 0, 0, 0, 0, depthRangeMin);
  popStyle();

  //mark depthRangeMin
  fill(255);
  text(depthRangeMin, 0, -75, depthRangeMin);
  //mark depthRangeMax
  fill(255);
  text(depthRangeMax, 0, -75, depthRangeMax);

  //draw 2 srf
  fill(255, 255, 0, 100);
  pushMatrix();
  translate(0, 0, depthRangeMin);
  rect(0, 0, width, height);
  popMatrix();

  fill(255, 0, 255, 100);
  pushMatrix();
  translate(0, 0, depthRangeMax);
  rect(0, 0, width, height);
  popMatrix();

  //drawLine connect srf; depthRangeMin to Max
  pushStyle();
  stroke(0, 255, 255);
  strokeWeight(1);
  line(0, 0, depthRangeMin, 0, 0, depthRangeMax);
  line(width, 0, depthRangeMin, width, 0, depthRangeMax);
  line(0, height, depthRangeMin, 0, height, depthRangeMax);
  line(width, height, depthRangeMin, width, height, depthRangeMax);
  popStyle();
}

void keyPressed() {
  if (key == ' ') debug = !debug;
}