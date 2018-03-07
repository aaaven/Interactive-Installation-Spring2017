//Aven,03/31/2017
//Interactive Installation
//New Media, WPP, SADA

import processing.video.*;

Capture cam;


void setup() {
  size(640, 360);
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("No cameras available.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(i + ": " + cameras[i]);
    }
    cam = new Capture(this, cameras[3]); // index[3]: 640x480, 30fps
    cam.start();
  }
}


void draw() {
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }
  
  int h = cam.height;
  int w = cam.width;
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      
      int i =  x + y*w; 
      
      int r = int( red(cam.pixels[i])); 
      int g = int( green(cam.pixels[i]));
      int b = int( blue(cam.pixels[i]));
      
      int average = (r+g+b)/3;
      if (x < width/2) {
        cam.pixels[i] = color(average);
      }
    }
  }
  cam.updatePixels();
  image(cam, 0, 0);
}