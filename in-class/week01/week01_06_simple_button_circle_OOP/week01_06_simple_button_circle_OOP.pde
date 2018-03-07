//Aven,02/27/2017,New Meida,WPP,SADA

Button button1;  // float a; 
Button button2;
void setup() {
  size(400, 600);
  button1 = new Button(width/2, height/3, 100); // a = 1.3;
  button2 = new Button(width/2, 2*height/3, 150);
}
void draw() {
  background(0);
  button1.checkDistance();
  button1.display();
  button2.checkDistance();
  button2.display();
}

/* homework

download and try:
controlP5 

continue on button sketch

*/