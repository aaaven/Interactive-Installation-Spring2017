//Aven,04/23/2017
//Interactive Installation
//New Media, WPP, SADA

import processing.video.*;
Capture cam;
trackColor[] tCols = new trackColor[2];
int tcIndex;
boolean showImg = true;
void setup() {
  size(640, 360);
  setupCam();
  for (int i = 0; i < tCols.length; i ++) {
    tCols[i] = new trackColor();
  }
  rectMode(CENTER);
}

void draw() {
  background(255);
  trackCol();
  fill(255, 0, 0);
  noStroke();
  rect(tCols[0].pos.x, tCols[0].pos.y, 5, 120);
  rect(tCols[1].pos.x, tCols[1].pos.y, 5, 120);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (tcIndex < tCols.length) {
      tCols[tcIndex].pcolor = cam.get(mouseX, mouseY);
      tcIndex ++;
    }
  } else if (mouseButton == RIGHT) {
    tcIndex = 0;
  }
}

void keyPressed() {
  if (key == ' ') {
    showImg = !showImg;
  }
}
void setupCam() {
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
}

void trackCol() {
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }
  int h = cam.height;
  int w = cam.width;
  for (int j = 0; j < tCols.length; j ++) {
    tCols[j].init();
  }
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; // IMPORTANT

      int r = int( red(cam.pixels[i]) ); 
      int g = int( green(cam.pixels[i]) );
      int b = int( blue(cam.pixels[i]) );
      for (int j = 0; j < tCols.length; j ++) {
        tCols[j].updatePixel(r, g, b, i, x, y);
      }
    }
  }
  if (showImg)image(cam, 0, 0);
  for (int j = 0; j < tCols.length; j ++) {
    tCols[j].updateImg();
    tCols[j].displayColor(new PVector(j*22 + 10, 10));
  }
}