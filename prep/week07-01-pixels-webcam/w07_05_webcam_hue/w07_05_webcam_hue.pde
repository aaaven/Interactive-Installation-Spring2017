//Aven,04/08/2017
//Interactive Installation
//New Media, WPP, SADA


import processing.video.*;
Capture cam;
PImage img;

PImage sampleColorImg;
color[] sampleColors = new color[766];

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
  img = createImage(640, 360, RGB); //ARGB  //not RGBA

  // load sample colors
  sampleColorImg = loadImage("gradationSample.png");
  int w = sampleColorImg.width;
  sampleColorImg.loadPixels();
  for (int i = 0; i < w; i++) {
    sampleColors[i] = sampleColorImg.pixels[i];
  }
  sampleColorImg.updatePixels();

  setupCP5();
}


void draw() {
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }

  // webcam
  int w = cam.width;
  int h = cam.height;
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; 

      int r = int( red(cam.pixels[i]) );
      int g = int( green(cam.pixels[i]) );
      int b = int( blue(cam.pixels[i]) );
      int sum = r+g+b; // this becomes index

      sum = (int)map(sum, 0, 766, colorMin, colorMax);

      img.pixels[i] = sampleColors[sum];
    }
  }
  println(colorMin);
  img.updatePixels();
  image(img, 0, 0);
}