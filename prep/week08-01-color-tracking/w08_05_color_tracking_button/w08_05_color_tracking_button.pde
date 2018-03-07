//Aven,04/16/2017
//Interactive Installation
//New Media, WPP, SADA

import processing.video.*;

Capture cam;
PImage img;
color pcolor;
int t = 5;
PVector clrtrack;
Button button1, button2;

void setup() {
  size(640, 360);
  setupSound();
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
  img = createImage(640, 360, ARGB); //ARGB, if you want to add alpha  //not RGBA
  button1 = new Button(width/2, height/3, 100);
  button2 = new Button(width/2, 2*height/3, 50);
  clrtrack = new PVector(0, 0);
}


void draw() {
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }
  img.loadPixels();
  int h = cam.height;
  int w = cam.width;
  int sumX = 0, sumY = 0, count = 0;
  PVector max = new PVector(0, 0);
  PVector min = new PVector(width, height);
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; // IMPORTANT

      int r = int( red(cam.pixels[i]) ); 
      int g = int( green(cam.pixels[i]) );
      int b = int( blue(cam.pixels[i]) );

      int tr = (int)abs(r - red(pcolor));
      int tg = (int)abs(g - green(pcolor));
      int tb = (int)abs(b - blue(pcolor));

      if (tr < t && tg < t && tb < t) {
        img.pixels[i] = color(255, 255, 0);
        //get sum
        sumX += x;
        sumY += y;
        count ++;

        //get min and max
        if (x > max.x) max.x = x;
        if (x < min.x) min.x = x;
        if (y > max.y) max.y = y;
        if (y < min.y) min.y = y;
      } else {
        img.pixels[i] = color(0, 0);
      }
    }
  }
  img.updatePixels();
  //display PImage img instead of cam object
  image(cam, 0, 0);
  image(img, 0, 0);

  //get average
  if (count != 0) {
    clrtrack.x = sumX/count;
    clrtrack.y = sumY/count;
    println(clrtrack);
  } else {
    clrtrack.x = 0;
    clrtrack.y = 0;
  }
  drawLine(clrtrack, color(255));

  button1.run();
  button2.run();
}

void mousePressed() {
  pcolor = cam.get(mouseX, mouseY);
}

void drawLine(PVector l, color clr) {
  pushStyle();
  stroke(clr);
  strokeWeight(1);
  line(l.x, 0, l.x, height);
  line(0, l.y, width, l.y);
  popStyle();
}