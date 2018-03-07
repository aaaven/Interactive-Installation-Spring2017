//Aven,03/05/2017
//Interactive Installation
//New Media, WPP, SADA

Button button1;  // float a; 
Button button2;
void setup() {
  size(400, 600);
  button1 = new Button(width/2, height/3, 100); // a = 1.3;
  button2 = new Button(width/2, 2*height/3, 150);
}
void draw() {
  background(0);
  button1.run();
  button2.run();
}

/* homework

download and try:
controlP5 

continue on button sketch

*/