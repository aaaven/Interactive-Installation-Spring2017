import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
Kinect2 kinect2;
PImage depthImg;
int depthMin = 500,depthMax = 3500;
/*
run:   __.getRawDepth();          --return depth array (raw) 
 */
void setup() {
  size(512, 424, P2D);
  kinect2 = new Kinect2(this);
  //init depth camera
  kinect2.initDepth();
  kinect2.initDevice();
  depthImg = createImage(kinect2.depthWidth, kinect2.depthHeight, ARGB);
}
void draw() {
  background(0);
  int[] depthData = kinect2.getRawDepth(); // 0 ~ 4499
  PImage depth = kinect2.getDepthImage();
  depth.loadPixels();
  depthImg.loadPixels();
  for (int y = 0; y < depthImg.height; y ++) {
    for (int x = 0; x < depthImg.width; x++) {
      int index = y * depthImg.width + x;
      if (depthData[index] > depthMin && depthData[index] < depthMax) {
        float r = map(depthData[index],depthMin, depthMax,255,0);
        float b = map(depthData[index],depthMin, depthMax,0,255);
        depthImg.pixels[index] = color(r,0,b);
      }else{
      depthImg.pixels[index] = color(0,0);
      }
    }
  }
  depthImg.updatePixels();
  depth.updatePixels();

  //image(kinect2.getDepthImage(), 0, 0); //draw depth image
  image(depthImg, 0, 0);
}