//Aven,02/27/2017,New Meida,WPP,SADA
color buttonColor = color(255);
float x,y,w = 100,h = 50;
void setup() {
  size(400,600);
  x = width/2;
  y = height/2;
  rectMode(CENTER);
}
void draw() {
  background(0);
  fill(buttonColor);
  rect(x,y,w,h);    //center: width/2,height/2; w: 100,h:50
  if(mouseX > x-w/2 && mouseX < x+w/2 &&
  mouseY > y-h/2 && mouseY < y+h/2){
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