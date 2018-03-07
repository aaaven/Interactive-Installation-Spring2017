//Aven,04/08/2017
//Interactive Installation
//New Media, WPP, SADA


//video -> capture ->GettingStartedCapture example
import processing.video.*;
Capture cam;

void setup() {
  size(640, 480);
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
}


void draw() {
  if (cam.available()) {
    cam.read();
  }
  image(cam, 0, 0);
}