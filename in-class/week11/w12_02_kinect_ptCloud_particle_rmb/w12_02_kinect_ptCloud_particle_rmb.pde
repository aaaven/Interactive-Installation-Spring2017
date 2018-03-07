//Aven,05/10/2017
//Interactive Installation
//New Media, WPP, SADA

import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

//depth image control factors
PImage colorImg;
PImage m;
int depthRangeMin = 5, depthRangeMax = 4499, imgScale = 4, resolution = 2;
int leftX = 0, rightX = imgScale*512, topY = 0, bottonY = imgScale*424;

PVector imgRange;
boolean debug = true;

//kinect setup
Kinect2 kinect2;

ArrayList<Particle> particles = new ArrayList<Particle>();
int particleInterval = 0;

void setup() {
  //size(1600, 900, P3D);
  fullScreen(P3D);
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
  m = loadImage("100.jpeg");
  m.resize(100,49);
  textMode(SHAPE);
}


void draw() {
  background(100);
  drawGUI();

  if (debug)showCamLookAt();
  centerObject2Cam();
  if (debug)debugDraw();

  colorImg = kinect2.getRegisteredImage();
  colorImg.loadPixels();  
  int[] rawDepth = kinect2.getRawDepth();
  PVector[] ptCloud = new PVector[512*424];
  for (int y = 0; y < colorImg.height; y += resolution) {
    for (int x = 0; x < colorImg.width; x += resolution) {

      int index = y * colorImg.width + x;
      ptCloud[index] = new PVector(imgScale*x, imgScale*y, rawDepth[index]);

      //show point cloud
      boolean inRange = ptCloud[index].z >= depthRangeMin && ptCloud[index].z <= depthRangeMax
        && ptCloud[index].x < rightX && ptCloud[index].x > leftX 
        && ptCloud[index].y < bottonY && ptCloud[index].y > topY;
      if (inRange) { // point cloud in the range box
        //show ptCloud
        stroke(colorImg.pixels[index]);
        strokeWeight(imgScale);
        point(ptCloud[index].x, ptCloud[index].y, ptCloud[index].z);

        // add particle
        if (particles.size() < 100 && particleInterval <= 0) {
          particles.add( new Particle(
            ptCloud[index].x, ptCloud[index].y, ptCloud[index].z, colorImg.pixels[index]));
          particleInterval = 20;
        }else {
        particleInterval--;
        }
      }
    }
  }
  colorImg.updatePixels();

  // we have to flip the direction of loop in order to remove the particles without an error.
  for (int i=particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.run();

    if (p.alpha <= 0) {
      particles.remove(i);
    }
  }
}