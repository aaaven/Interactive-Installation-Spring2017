import peasy.*;
PeasyCam cam;

void setupCam() {
  cam = new PeasyCam(this, width/2, height/2, 0.5*(depthRangeMin + depthRangeMax), 3000); //400~1400
  cam.setMinimumDistance(1000);
  cam.setMaximumDistance(5000);
}