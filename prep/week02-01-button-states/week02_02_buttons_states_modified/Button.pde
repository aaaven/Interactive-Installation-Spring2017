//this is the button class
class Button {
  float x, y, size;
  int result = 0;
  color buttonColor = color(100);
  boolean click;
  boolean hover;
  boolean preClick = false;
  boolean preHover = false;

  Button(float _x, float _y, float _size) {
    x = _x;
    y = _y;
    size = _size;
  }
  void check() {
    hover = false;
    click = false;
    float distance = dist(x, y, mouseX, mouseY);

    //check hover and click
    if ( distance < size/2&&!mousePressed) {  
        hover = true; 
        //println("mouse is hovering");
    } 
    if (distance < size/2 && mousePressed) { 
      click = true; 
      //println("mouse is clicking");
    } 
    
    //we have some issue here, let's fix it in the next version
    //you will get off-hover message before on-click
    //also you will get on-hover message along with off-click
    
    
    //check hover on and off
    if (!preHover&&hover) {//preClick == false && click == true
      println("on-hover");
    }
    if (preHover&&!hover) {
      println("off-hover");
    }
    //check click on and off
    if (!preClick&&click) {//preClick == false && click == true
      println("on-click");
    }
    if (preClick&&!click) {
      println("off-click");
    }
    preHover = hover;
    preClick = click;
  }

  void update() {
    buttonColor = color(100);
    if (click) {
      buttonColor = color(random(255), random(255), random(255));
    }
    if (hover) {
      buttonColor = color(255, 0, 0);
    }
  }
  void display() {
    pushStyle();
    fill(buttonColor);
    ellipse(x, y, size, size);
    popStyle();
  }
  void run() {
    check();
    update();
    display();
  }
}