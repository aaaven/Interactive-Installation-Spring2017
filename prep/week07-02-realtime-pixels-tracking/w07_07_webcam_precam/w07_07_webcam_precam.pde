//Aven,04/08/2017
//Interactive Installation
//New Media, WPP, SADA


//video -> capture ->GettingStartedCapture example

import processing.video.*;

Capture cam;
PImage preCam;
PImage diff;

void setup() {
  size(640, 720);
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    printArray(cameras);//print out all aviable cameras
    cam = new Capture(this, cameras[3]); //choose the one you want to use
    cam.start();
  }
  preCam = createImage(640, 360, RGB);
  diff = createImage(640, 360, RGB);
}


void draw() {
  if (cam.available()) {
    cam.read();
    //draw out
    image(cam, 0, 0);
    image(preCam, 0, 360);
    //draw out
    cam.loadPixels();
  }
  
  preCam.loadPixels();
  
  int h = cam.height;
  int w = cam.width;
  
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; // IMPORTANT
      preCam.pixels[i] = cam.pixels[i];
    }
  }
  preCam.updatePixels();
  cam.updatePixels();
}