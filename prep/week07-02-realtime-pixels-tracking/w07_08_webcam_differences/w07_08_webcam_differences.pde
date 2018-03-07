//Aven,04/08/2017
//Interactive Installation
//New Media, WPP, SADA


//video -> capture ->GettingStartedCapture example

import processing.video.*;

Capture cam;
PImage preCam;
PImage diff;

void setup() {
  size(640, 1080);
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
    image(preCam, 0, 720);
    //draw out
    cam.loadPixels();
  }

  preCam.loadPixels();
  diff.loadPixels();

  int h = cam.height;
  int w = cam.width;

  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; 

      int r = int( red(cam.pixels[i]) );
      int g = int( green(cam.pixels[i]) );
      int b = int( blue(cam.pixels[i]) );

      int prevR = int( red(preCam.pixels[i]) );
      int prevG = int( green(preCam.pixels[i]) );
      int prevB = int( blue(preCam.pixels[i]) );

      int diffR = abs(r-prevR);
      int diffG = abs(g-prevG);
      int diffB = abs(b-prevB);

      diff.pixels[i] = color(5*diffR, 5*diffG, 5*diffB);      

      preCam.pixels[i] = cam.pixels[i];
    }
  }
  preCam.updatePixels();
  cam.updatePixels();

  diff.updatePixels();
  image(diff, 0, 360);
}