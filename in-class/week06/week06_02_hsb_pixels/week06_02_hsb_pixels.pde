//Aven,04/01/2017
//Interactive Installation
//New Media, WPP, SADA

int gridX = 60, gridY = 60, gridPlus = 1;
void setup() {
  size(720, 720);
  background(0);
  colorMode(HSB,height,width,100);
  noStroke();
}

void draw() {
  for (int j = 0; j < height; j +=gridY) {
    //---------------------------------------------------
    for (int i = 0; i < width; i+=gridX) {
      fill(j,width - i,100);
      rect(i, j, gridX, gridY);
    }
    //---------------------------------------------------
  }
  if (gridX >= 60 || gridX <= 1 ) gridPlus*=-1;
  println(gridX +"  plus: "+gridPlus);
  gridX += gridPlus;
  gridY += gridPlus;
}