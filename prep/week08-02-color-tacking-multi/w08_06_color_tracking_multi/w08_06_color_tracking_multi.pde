//Aven,04/23/2017
//Interactive Installation
//New Media, WPP, SADA

import processing.video.*;

Capture cam;
PImage[] img;
color[] pcolors;
int t = 20, colorNum = 3;
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
  img = new PImage[colorNum];
  for (int col = 0; col < colorNum; col++) {
    img[col] = createImage(640, 360, ARGB); //ARGB, if you want to add alpha  //not RGBA
  }
  pcolors = new color[colorNum];
}


void draw() {
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }
  for (int col = 0; col < colorNum; col++) {
    img[col].loadPixels();
  }
  int h = cam.height;
  int w = cam.width;

  int[] sumX = {0, 0, 0};
  int[] sumY = {0, 0, 0};
  int[] count = {0, 0, 0};
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; // IMPORTANT

      int r = int( red(cam.pixels[i]) ); 
      int g = int( green(cam.pixels[i]) );
      int b = int( blue(cam.pixels[i]) );

      int[] tr = new int[3];
      int[] tg = new int[3];
      int[] tb = new int[3];
      for (int col = 0; col < colorNum; col++) {
        tr[col] = (int)abs(r - red(pcolors[col]));
        tg[col] = (int)abs(g - green(pcolors[col]));
        tb[col] = (int)abs(b - blue(pcolors[col]));

        if (tr[col] < t && tg[col] < t && tb[col] < t) {
          switch (col) {
          case 0:
          img[col].pixels[i] = color(255, 0, 0);
            break;
          case 1:
          img[col].pixels[i] = color(0, 255, 0);
            break;
          case 2:
          img[col].pixels[i] = color(0, 0, 255);
            break;
          }
          sumX[col] += x;
          sumY[col] += y;
          count[col] ++;
        } else {
          img[col].pixels[i] = color(0, 0);
        }
      }
    }
  }
  image(cam, 0, 0);


  //get average
  for (int col = 0; col < colorNum; col++) {
    img[col].updatePixels();
    //display PImage img instead of cam object
    image(img[col], 0, 0);
    if (count[col] != 0) {
      float ax = sumX[col]/count[col];
      float ay = sumY[col]/count[col];
      println("x" + ax + "y" + ay);

      pushStyle();
      stroke(pcolors[col]);
      strokeWeight(1);
      line(ax, 0, ax, height);
      line(0, ay, width, ay);
      popStyle();
    }
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    pcolors[0] = cam.get(mouseX, mouseY);
  } else if (mouseButton == RIGHT) {
    pcolors[1] = cam.get(mouseX, mouseY);
  } else {
    pcolors[2] = cam.get(mouseX, mouseY);
  }
}