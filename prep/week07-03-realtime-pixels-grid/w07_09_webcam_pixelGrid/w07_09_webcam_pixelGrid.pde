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
    cam = new Capture(this, cameras[3]); // index[3]: 640x360, 30fps
    cam.start();
  }
  noStroke();
  ellipseMode(CORNER);
}


void draw() {
  background(255);

  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }

  int cellSize = 15;
  int w = cam.width;
  int h = cam.height;
  for (int y = 0; y < h; y+=cellSize) {
    for (int x = 0; x < w; x+=cellSize) {
      int i =  x + y*w; 

      int r = int( red(cam.pixels[i]) );
      int g = int( green(cam.pixels[i]) );
      int b = int( blue(cam.pixels[i]) );

      fill(r, g, b);
      //rect(x, y, cellSize, cellSize); 
      //ellipse(x, y, cellSize, cellSize); 
      rect(x, y, 0.8*cellSize, 0.8*cellSize);
    }
  }
}