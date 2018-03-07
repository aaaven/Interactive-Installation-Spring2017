//Aven,03/04/2017
//Interactive Installation
//New Media, WPP, SADA

void setup() {
  size(700, 400);
  noStroke();
  setupControlP5();
}

void draw() {
  background(0);

  fill(sliderValue1);
  rect(0, 0, width, 100);

  fill(sliderTicks1);
  rect(0, 100, width/2, 250);

  fill(sliderValue2);
  rect(width/2, 100, width/2, 250);

  fill(sliderTicks2);
  rect(0, 350, width, 50);
}