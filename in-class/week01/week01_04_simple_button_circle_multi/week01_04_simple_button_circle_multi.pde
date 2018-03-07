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
  
  fill(button1Color);
  ellipse(x1, y1, size1, size1);    //center: width/2,height/2; radius: size
  
  fill(button2Color);
  ellipse(x2, y2, size2, size2);
  
  // check distance1
  float distance1  = dist(x1, y1, mouseX, mouseY); // mouse loc---center
  if (distance1 < size1/2) {
    //------------------
    if (mousePressed) { //hover and click
      button1Color = color(random(255), random(255), random(255));
    } else {//hover non-click
      button1Color = color(100);
    }
    //-------------------
  } else {
    button1Color= color(255);
  }
  // check distance2
  float distance2  = dist(x2, y2, mouseX, mouseY); // mouse loc---center
  if (distance2 < size2/2) {
    //------------------
    if (mousePressed) { //hover and click
      button2Color = color(random(255), random(255), random(255));
    } else {//hover non-click
      button2Color = color(100);
    }
    //-------------------
  } else {
    button2Color= color(255);
  }
  //check distance2
}