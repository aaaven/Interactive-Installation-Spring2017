//Aven,04/25/2017
//Interactive Installation
//New Media, WPP, SADA


import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

//depth image control factors
PImage depthImg;
int depthRangeMin = 0, depthRangeMax = 3000;
//kinect setup
Kinect2 kinect2;


void setup() {
  size(512, 424, P3D);
  setupCP5();
  kinect2 = new Kinect2(this);

  //enable depth camera
  kinect2.initDepth();
  //enable device
  kinect2.initDevice();

  //create depth image
  depthImg = createImage(kinect2.depthWidth, kinect2.depthHeight, ARGB);
}


void draw() {
  background(0);
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
        depthImg.pixels[index] = color(r, 0, b); //x,y
      } else {
        depthImg.pixels[index] = color(0, 0);
      }
      stroke(depthImg.pixels[index]);
      strokeWeight(1);
      point(x,y,rawDepth[index]);
    }
  }
  depthImg.updatePixels();

  //show depthImg
  //background(0);
  //image(depthImg, 0, 0);

  //frameRate monitoring
  fill(255);
  text(frameRate, width - 50, 20);
}