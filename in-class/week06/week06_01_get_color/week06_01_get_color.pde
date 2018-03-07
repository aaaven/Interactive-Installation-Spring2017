//Aven,04/01/2017
//Interactive Installation
//New Media, WPP, SADA

PImage img;  //int a;

void setup() {
  size(600, 800);
  img = loadImage("1.jpg"); //a = 0;
  //background(img);
  img.resize(width, height);
  image(img, 0, 0);
}

void draw() {
  color pixel = img.get(mouseX, mouseY);
  println("hue:  "+hue(pixel), 
    "sat:  "+saturation(pixel), 
    "bri:  "+brightness(pixel));
}