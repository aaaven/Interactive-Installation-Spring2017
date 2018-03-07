//Aven,04/25/2017
//Interactive Installation
//New Media, WPP, SADA


import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

//depth image control factors
PImage depthImg;
int depthRangeMin = 0, depthRangeMax = 4499, imgScale = 5;
PVector imgRange;
boolean debug = true;

//kinect setup
Kinect2 kinect2;


void setup() {
  size(1600, 900, P3D);
  setupCP5();
  setupCam();
  kinect2 = new Kinect2(this);

  //enable depth camera
  kinect2.initDepth();
  //enable device
  kinect2.initDevice();

  //create depth image
  depthImg = createImage(kinect2.depthWidth, kinect2.depthHeight, ARGB);

  //imageScale
  imgRange = new PVector(512*imgScale, 424*imgScale);
}


void draw() {
  background(0);
  
  drawGUI(); 
  if (debug)showCamLookAt();
  centerObject2Cam();
  if (debug)debugDraw();

  //map raw depth to red/blue color and update depthImg
  int[] rawDepth = kinect2.getRawDepth();
  depthImg.loadPixels();
  for (int y = 0; y < depthImg.height; y++) {
    for (int x = 0; x < depthImg.width; x++) {

      int index = y * depthImg.width + x;
      float r = map(rawDepth[index], depthRangeMin, depthRangeMax, 255, 0);
      float b = map(rawDepth[index], depthRangeMin, depthRangeMax, 0, 255);
      depthImg.pixels[index] = color(r, 0, b);

      boolean inRange = rawDepth[index] >= depthRangeMin && rawDepth[index] <= depthRangeMax;
      if (inRange) {
        //show ptCloud
        stroke(depthImg.pixels[index]);
        strokeWeight(1);
        point(imgScale*x, imgScale*y, rawDepth[index]);
      }
    }
  }
  depthImg.updatePixels();
}