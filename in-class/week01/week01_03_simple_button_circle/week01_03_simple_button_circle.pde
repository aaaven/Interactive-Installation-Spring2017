//Aven,02/27/2017,New Meida,WPP,SADA
color buttonColor = color(255);
float x,y,size = 100;
void setup() {
  size(400,600);
  x = width/2;
  y = height/2;
}
void draw() {
  background(0);
  fill(buttonColor);
  ellipse(x,y,size,size);    //center: width/2,height/2; radius: size
  // check distance
  float distance  = dist(x,y,mouseX,mouseY); // mouse loc---center
  if(distance < size/2){
    //------------------
    if(mousePressed){ //hover and click
      buttonColor = color(random(255),random(255),random(255));
    }else{//hover non-click
        buttonColor = color(100);
    }
    //-------------------
  }else{
    buttonColor= color(255);
  }
}