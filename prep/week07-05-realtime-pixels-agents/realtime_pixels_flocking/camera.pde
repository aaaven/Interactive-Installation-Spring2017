import processing.video.*;
Capture cam;

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
    // this is equivalent to:  printArray(cameras);
    cam = new Capture(this, cameras[3]); // index[3]: 640x360, 30fps
    cam.start();
  }
}

color[] getColors(int w, int h) {
  color[] _colors = new color[w*h];
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; 
      color c = (color)cam.pixels[i];
      _colors[i] = c;
    }
  }
  cam.updatePixels();
  return _colors;
}