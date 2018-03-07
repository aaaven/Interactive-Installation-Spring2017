//Aven,04/17/2017
//Interactive Installation
//New Media, WPP, SADA

import processing.video.*;

Capture cam;
PImage img;

color pick;
int t = 10;
float ax, ay;
Button button1, button2;

void setup() {
  size(640, 360);
  button1 = new Button(width/2, height/3, 100);
  button2 = new Button(width/2, 2*height/3, 50);
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
  background(0);
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }
  img.loadPixels();
  int h = cam.height;
  int w = cam.width;
  int sumX = 0, sumY = 0, count = 0;
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; // IMPORTANT

      int r = int( red(cam.pixels[i]) ); 
      int g = int( green(cam.pixels[i]) );
      int b = int( blue(cam.pixels[i]) );

      float tr = abs(r - red(pick));
      float tg = abs(g - green(pick));
      float tb = abs(b - blue(pick));
      // find bright area
      if ( tr < t &&
        tg < t &&
        tb < t) {
        img.pixels[i] = color(255, 255, 0);
        count ++;
        sumX += x;
        sumY += y;
      } else {
        img.pixels[i] = color(r, g, b);
      }
    }
  }
  img.updatePixels();
  //display PImage img instead of cam object
  image(img, 0, 0);

  //get center
  if (count != 0) {
    ax = sumX/count;
    ay = sumY/count;
    drawCross(ax, ay);
  } 

  pushStyle();
  fill(pick);
  noStroke();
  rect(10, 10, 50, 50);
  popStyle();

  button1.run();
  button2.run();
}

void mousePressed() {
  pick = cam.get(mouseX, mouseY);
}

void drawCross(float lx, float ly) {
  pushStyle();
  stroke(255, 0, 0);
  strokeWeight(1);
  line(lx, 0, lx, height);
  line(0, ly, width, ly);
  popStyle();
}