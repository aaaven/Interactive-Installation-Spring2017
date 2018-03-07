void showCamLookAt() {
  //display camLookAt pos
  fill(0, 255, 255);
  pushMatrix();
  translate(cam.getLookAt()[0], cam.getLookAt()[1], cam.getLookAt()[2]);
  sphere(30);
  popMatrix();
}
void debugDraw() {
  int kinectPosX = imgScale*512/2;
  int kinectPosY = imgScale*424/2;
  //show full range of kinect
  pushStyle();
  pushMatrix();
  translate(kinectPosX, kinectPosY, 2249.5);
  scale(0.455212269, 0.376972661);
  noFill();
  strokeWeight(1);
  stroke(255);
  box(4499);
  popMatrix();
  popStyle();

  float centerX = 0.5*(leftX + rightX);
  float centerY = 0.5*(topY + bottonY);
  int rangeX = rightX - leftX;
  int rangeY = bottonY - topY;

  //display world coordinate origin
  pushMatrix();
  translate(kinectPosX, kinectPosY, 0);
  noStroke();
  fill(0, 0, 255);
  sphere(30);
  popMatrix();

  //show origin
  fill(125, 0, 125);
  textSize(150);
  text("World Origin | Kinect location", 0, -75, 0);

  //drawLine connect origin and srf conner: depthRangeMin
  pushStyle();
  stroke(255, 0, 255);
  strokeWeight(1);  
  line(kinectPosX, kinectPosY, 0, leftX, topY, depthRangeMin);
  line(kinectPosX, kinectPosY, 0, rightX, topY, depthRangeMin);
  line(kinectPosX, kinectPosY, 0, leftX, bottonY, depthRangeMin);
  line(kinectPosX, kinectPosY, 0, rightX, bottonY, depthRangeMin);
  stroke(0, 255, 255);
  line(kinectPosX, kinectPosY, 0, centerX, centerY, depthRangeMin);
  popStyle();

  //mark depthRangeMin
  fill(255);
  text("depthMin" + depthRangeMin, 0, -75, depthRangeMin);
  //mark depthRangeMax
  fill(255);
  text("depthMax" + depthRangeMax, 0, -75, depthRangeMax);

  //draw 2 srf
  pushMatrix();
  translate(centerX, centerY, depthRangeMin);
  fill(255, 255, 0, 50);
  rect(0, 0, rangeX, rangeY);
  fill(0, 255, 255);
  sphere(30);
  popMatrix();

  pushMatrix();
  translate(centerX, centerY, depthRangeMax);
  fill(255, 0, 255, 50);
  rect(0, 0, rangeX, rangeY);
  fill(0, 255, 255);
  sphere(30);
  popMatrix();

  //drawLine connect srf; depthRangeMin to Max
  pushStyle();
  stroke(0, 255, 255);
  strokeWeight(1);
  line(centerX, centerY, depthRangeMin, centerX, centerY, depthRangeMax);
  stroke(255,0,0);
  line(leftX, topY, depthRangeMin, leftX, topY, depthRangeMax);
  line(rightX, topY, depthRangeMin, rightX, topY, depthRangeMax);
  line(leftX, bottonY, depthRangeMin, leftX, bottonY, depthRangeMax);
  line(rightX, bottonY, depthRangeMin, rightX, bottonY, depthRangeMax);
  popStyle();
}