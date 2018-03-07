//Aven,03/31/2017
//Interactive Installation
//New Media, WPP, SADA

//create a PImage object to store pixels after changing its color values
//and load that PImage object to display
//instead of loading and saving directly to the source cam object
//to see consistent change in color

import processing.video.*;

Capture cam;
PImage img;

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
    cam = new Capture(this, cameras[3]); // index[3]: 640x360, 30fps
    cam.start();
  }
  //create an empty PImage object
  img = createImage(640, 360, RGB); //ARGB, if you want to add alpha  //not RGBA
}


void draw() {
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }
  img.loadPixels();
  int h = cam.height;
  int w = cam.width;
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; // IMPORTANT
      
      int r = int( red(cam.pixels[i]) ); 
      int g = int( green(cam.pixels[i]) );
      int b = int( blue(cam.pixels[i]) );
      
      // why do we store the color values in img?
      if (x < width/2) {
        img.pixels[i] = color(g,b,0);
      } else {
        img.pixels[i] = color(0,r,g);
      }
    }
  }
  img.updatePixels();
  //display PImage img instead of cam object
  image(img, 0, 0);
}