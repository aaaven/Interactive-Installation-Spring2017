//Aven,05/16/2017
//get closet point and store in a PVector closet 
import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

//depth image control factors
PImage colorImg;

int resolution = 5, pointSize = 2;
int imgScale = 2;
int depthRangeMin = 500, depthRangeMax = 4321, leftX = 0, rightX = imgScale*512, topY = 0, bottonY = imgScale*424;

PVector imgRange;
boolean debug = true;

int closestZ = 4499, closestX = 0, closestY = 0;
//kinect setup
Kinect2 kinect2;
void setup() {
  fullScreen();
  //size(1600, 900, P3D);
  setupCP5();
  //setupCam();
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
  rectMode(CENTER);
}


void draw() {
  background(100);

  colorImg = kinect2.getRegisteredImage();
  colorImg.loadPixels();  
  int[] rawDepth = kinect2.getRawDepth();
  PVector[] ptCloud = new PVector[512*424];
  PVector closest = new PVector(0, 0, 4499);

  for (int y = 0; y < colorImg.height; y += resolution) {
    for (int x = 0; x < colorImg.width; x += resolution) {

      int index = y * colorImg.width + x;
      ptCloud[index] = new PVector(imgScale*x, imgScale*y, rawDepth[index]);

      //show point cloud
      boolean inRange = ptCloud[index].z >= depthRangeMin && ptCloud[index].z <= depthRangeMax
        && ptCloud[index].x < rightX && ptCloud[index].x > leftX 
        && ptCloud[index].y < bottonY && ptCloud[index].y > topY;
      if (inRange) {
        //show ptCloud
        stroke(colorImg.pixels[index]);
        strokeWeight(pointSize);
        point(ptCloud[index].x, ptCloud[index].y);
        //closest point 
        if (ptCloud[index].z < closest.z) {
          closest.z = ptCloud[index].z;
          closest.x = ptCloud[index].x;
          closest.y = ptCloud[index].y;
        }
      }
    }
  }

  if (debug) {
    cp5.draw();
    //frameRate monitoring
    fill(255);
    textSize(10);
    text(frameRate, width - 50, 20);
    text((int)closest.x, width - 50, 35);
    text((int)closest.y, width - 50, 50);
    text((int)closest.z, width - 50, 65);
    stroke(255);
    strokeWeight(1);
    line(closest.x, 0, closest.x, height);
    line(0, closest.y, width, closest.y);
  }
}