//Aven,03/04/2017
//Interactive Installation
//New Media, WPP, SADA


void setup() {
  size(400, 400, P3D);
  setupCam();
  setupControlP5();
}
void draw() {
  background(0);
  drawGUI();

  fill(fColor);
  box(boxSize);
  pushMatrix();
  translate(0, 0, 20);
  box(5);
  popMatrix();
}