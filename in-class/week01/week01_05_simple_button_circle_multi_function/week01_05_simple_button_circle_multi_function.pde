//Aven,02/27/2017,New Meida,WPP,SADA
color button1Color = color(255);
color button2Color = color(255);
float x1, y1, size1 = 100;
float x2, y2, size2 = 200;

void setup() {
  size(400, 600);
  x1 = width/2;
  y1 = height/3;
  x2 = width/2;
  y2 = 2*height/3;
}
void draw() {
  background(0);
  display(button1Color,x1,y1,size1);
  button1Color = checkDistance(x1, y1, size1);
  
  display(button2Color,x2,y2,size2);
  button2Color = checkDistance(x2, y2, size2);
  //button2Color = checkDistance(x2, y2 size2);
}

void display(color _buttonColor, float _x, float _y, float _size){
//------------dispaly---------------------
  fill(_buttonColor);
  ellipse(_x, _y, _size, _size);    //center: width/2,height/2; radius: size
  //------------dispaly---------------------
}

color checkDistance(float _x, float _y, float _size) {
  color buttonColor = color(255);
  // -----------------check distance-------------------
  float distance  = dist(_x, _y, mouseX, mouseY); // mouse loc---center
  if (distance < _size/2) {
    if (mousePressed) { //hover and click
      buttonColor = color(random(255), random(255), random(255));
    } else {//hover non-click
      buttonColor = color(100);
    }
  } else {
    buttonColor= color(255);
  }
  return buttonColor;
}