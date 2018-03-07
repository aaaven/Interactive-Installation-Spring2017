//Aven,02/27/2017,New Meida,WPP,SADA
void setup() {
  size(400,600);
}

void draw() {
  //center: width/2,height/2
  //w: 100,h:50
  background(0);
  rect(width/2-50,height/2-25,100,50);
  if(mouseX > width/2-50 && mouseX < width/2+50 &&
  mouseY > height/2-25 && mouseY < height/2+25){
    //------------------
    if(mousePressed){ //hover and click
      fill(random(255),random(255),random(255));
    }else{//hover non-click
        fill(100);
    }
    //-------------------
  }else{
    fill(255);
  }
}