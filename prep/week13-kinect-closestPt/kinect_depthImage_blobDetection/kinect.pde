import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

//depth image control factors
int depthRangeMin = 15, depthRangeMax = 3000;
//kinect setup
Kinect2 kinect2;

void setupKinect() {
  kinect2 = new Kinect2(this);

  //enable depth camera
  kinect2.initDepth();
  //enable video camera
  kinect2.initVideo();
  //enable device
  kinect2.initDevice();

  //create depth image
  depthImg = createImage(kinect2.depthWidth, kinect2.depthHeight, ARGB);
}

void updateKinect() {
  //map raw depth to red/blue color and update depthImg
  int[] rawDepth = kinect2.getRawDepth();
  depthImg.loadPixels();
  for (int y = 0; y < depthImg.height; y++) {
    for (int x = 0; x < depthImg.width; x++) {

      int index = y * depthImg.width + x;
      boolean inRange = rawDepth[index] >= depthRangeMin && rawDepth[index] <= depthRangeMax;
      if (inRange) {
        float r = map(rawDepth[index], depthRangeMin, depthRangeMax, 255, 0);
        float b = map(rawDepth[index], depthRangeMin, depthRangeMax, 0, 255);
        depthImg.pixels[index] = color(r, 0, b);
      } else {
        depthImg.pixels[index] = color(0);
      }
    }
  }
  depthImg.updatePixels();
}