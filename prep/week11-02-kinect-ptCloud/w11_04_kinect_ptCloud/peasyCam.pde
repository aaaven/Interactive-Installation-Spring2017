import peasy.*;
PeasyCam cam;

void setupCam() {
  cam = new PeasyCam(this, width/2, height/2, 0.5*(depthRangeMin + depthRangeMax), 3000);
  cam.setMinimumDistance(2000);
  cam.setMaximumDistance(4000);
}