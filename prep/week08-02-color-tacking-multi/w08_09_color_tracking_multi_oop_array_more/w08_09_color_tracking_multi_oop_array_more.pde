//Aven,04/23/2017
//Interactive Installation
//New Media, WPP, SADA

import processing.video.*;
Capture cam;
trackColor[] tCols = new trackColor[4];
int tcIndex;
void setup() {
  size(640, 360);
  setupCam();
  for (int i = 0; i < tCols.length; i ++) {
    tCols[i] = new trackColor();
  }
}

void draw() {
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
      for (trackColor tc : tCols) {
        tc.updatePixel(r, g, b, i, x, y);
      }
    }
  }
  image(cam, 0, 0);
  for (int j = 0; j < tCols.length; j ++) {
    tCols[j].updateImg();
    tCols[j].displayColor(new PVector(j*22, 10));
  }
}

void mousePressed() {
  if (tcIndex < tCols.length) {
    tCols[tcIndex].pcolor = cam.get(mouseX, mouseY);
    tcIndex ++;
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

class trackColor {
  PImage img;
  color pcolor, dcolor;
  int sumX = 0, sumY = 0, count = 0, t = 20;
  PVector pos; 
  trackColor() {
    img = createImage(640, 360, ARGB); //ARGB, if you want to add alpha  //not RGBA
    pcolor = color(0, 0, 0);
    pos = new PVector(0, 0);
  }

  void init() {
    img.loadPixels();
    sumX = 0;
    sumY = 0;
    count = 0;
  }

  void updatePixel(int r, int g, int b, int i, int x, int y) {
    int tr = (int)abs(r - red(pcolor));
    int tg = (int)abs(g - green(pcolor));
    int tb = (int)abs(b - blue(pcolor));

    if (tr < t && tg < t && tb < t) {
      img.pixels[i] = color(255, 255, 255);
      sumX += x;
      sumY += y;
      count ++;
    } else {
      img.pixels[i] = color(0, 0);
    }
  }
  void updateImg() {
    //display PImage img instead of cam object
    img.updatePixels();
    image(img, 0, 0);

    //get average
    if (count != 0) {
      pos.x = sumX/count;
      pos.y = sumY/count;
      println("pos" + pos.x + " , " + pos.y);
    }
  }
  void displayColor(PVector cPos) {
    pushStyle();
    stroke(pcolor);
    fill(pcolor);
    strokeWeight(1);
    line(pos.x, 0, pos.x, height);
    line(0, pos.y, width, pos.y);
    rect(cPos.x, cPos.y, 20, 20);
    popStyle();
  }
}