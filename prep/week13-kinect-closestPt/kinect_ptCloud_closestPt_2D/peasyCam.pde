import peasy.*;
PeasyCam cam;

void setupCam() {
  cam = new PeasyCam(this, width/2, height/2, 0.5*(depthRangeMin + depthRangeMax), 3000); //400~1400
  cam.setMinimumDistance(1000);
  cam.setMaximumDistance(5000);
}

void centerObject2Cam() {
  //get where camera is looking at 
  PVector camLookAt = new PVector(cam.getLookAt()[0], cam.getLookAt()[1], cam.getLookAt()[2]);
  //move staff center to camera's look at position
  PVector currentReference = new PVector ((leftX + rightX)/2, (topY + bottonY)/2, 0.5*(depthRangeMin + depthRangeMax));
  PVector moveDis = PVector.sub(camLookAt, currentReference);
  translate(moveDis.x, moveDis.y, moveDis.z);//translate works the same as to move objects there
}