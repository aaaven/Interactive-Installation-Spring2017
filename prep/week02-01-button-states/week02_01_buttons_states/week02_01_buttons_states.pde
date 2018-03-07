//Aven,02/26/2017
//Interactive Installation
//New Media, WPP, SADA

Button button1, button2;
void setup() {
  size(400, 400);
  stroke(0);
  button1 = new Button(width/2,height/3,100);
  button2 = new Button(width/2,2*height/3,50);
}
void draw() {
  background(100);
  button1.run();
  //button2.run();
}