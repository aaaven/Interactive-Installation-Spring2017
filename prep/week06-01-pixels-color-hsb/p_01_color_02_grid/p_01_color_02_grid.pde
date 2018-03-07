//Aven,03/31/2017
//Interactive Installation
//New Media, WPP, SADA

int gsize = 120;
int step = -1;
void setup() {
  size(720, 480);
  colorMode(HSB, width, height, width);
  noStroke();
  frameRate(24);
}


void draw() {
  for (int i =0; i < width; i+=gsize) {
    for (int j = 0; j < height; j+=gsize) {
      fill(i+0.5*gsize, j+0.5*gsize, width-mouseX);
      rect(i, j, gsize, gsize);
    }
  }  
  gsize += step;
  if (gsize >= 120 || gsize <= 1) step *= -1;
}