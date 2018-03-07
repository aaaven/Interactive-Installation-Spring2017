//Aven,04/26/2017
//Interactive Installation
//New Media, WPP, SADA

import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

//depth image control factors
PImage colorImg;

int depthRangeMin = 5, depthRangeMax = 4499, imgScale = 4;
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
  //enable registered image
  kinect2.initRegistered();
  //enable device
  kinect2.initDevice();

  //create color image
  colorImg = createImage(kinect2.depthWidth, kinect2.depthHeight, ARGB);

  //imageScale
  imgRange = new PVector(512*imgScale, 424*imgScale);
}


void draw() {
  background(0);
  drawGUI();

  if (debug)showCamLookAt();
  centerObject2Cam();
  if (debug)debugDraw();

  colorImg = kinect2.getRegisteredImage();
  colorImg.loadPixels();  
  int[] rawDepth = kinect2.getRawDepth();
  for (int y = 0; y < colorImg.height; y++) {
    for (int x = 0; x < colorImg.width; x++) {

      int index = y * colorImg.width + x;
      boolean inRange = rawDepth[index] >= depthRangeMin && rawDepth[index] <= depthRangeMax;
      if (inRange) {
        //show ptCloud
        stroke(colorImg.pixels[index]);
        strokeWeight(imgScale/2);
        point(imgScale*x, imgScale*y, rawDepth[index]);
      }
    }
  }
  colorImg.updatePixels();
}