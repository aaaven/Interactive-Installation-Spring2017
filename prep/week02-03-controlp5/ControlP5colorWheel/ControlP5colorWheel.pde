//Aven,03/04/2017
//Interactive Installation
//New Media, WPP, SADA

void setup() {
  size(800, 400);
  noStroke();
  setupControlP5();
}

void draw() {  
  background(0);
  fill( colorWheel );
  rect(width/2 + 10, 10, width/2-20, height-20);
}