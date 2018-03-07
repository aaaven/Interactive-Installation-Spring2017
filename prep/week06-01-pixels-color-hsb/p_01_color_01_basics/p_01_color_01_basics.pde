//Aven,03/31/2017
//Interactive Installation
//New Media, WPP, SADA

void setup() {
  size(600, 600);
  colorMode(HSB, height, 100, 100);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  int bg = height/2+mouseY;
  if(bg > height) bg -= height; //bg = bg - 360; 
  background(bg, 100, 100); //background
  fill(mouseY, 100, 100);
  rect(width/2, height/2, 120,120);
}