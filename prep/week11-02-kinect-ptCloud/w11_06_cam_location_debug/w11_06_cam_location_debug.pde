//Aven,04/25/2017
//Interactive Installation
//New Media, WPP, SADA

int depthRangeMin = 0, depthRangeMax = 4499;
boolean debug = true;
void setup() {
  size(1600, 900, P3D);
  setupCP5();
  setupCam();
}
void draw() {
  background(0);
  drawGUI();
  if (debug)showCamLookAt();
  centerObject2Cam();
  if (debug)debugDraw();
}