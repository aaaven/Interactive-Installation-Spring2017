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
    if ( distance < size/2) {  
      hover = true;
    } 
    if (distance < size/2 && mousePressed) { 
      click = true; 
      //when click is true, hover is also true,
      //so program cannot do color right
      //but the we can do on-off click/hover right in this way
    } 

    //check click on and off
    if (!preClick&&click) {//preClick == false && click == true
      println("on-click"); //on click event
      onClick();
    }
    if (preClick&&!click) {
      println("off-click");//off click event
      offClick();
    }

    //check hover on and off
    if (!preHover&&hover) {//preClick == false && click == true
      println("on-hover");//on hover event
      onHover();
    }
    if (preHover&&!hover) {
      println("off-hover");//off hover event
      offHover();
    }

    preHover = hover;
    preClick = click;
  }

  void display() {
    pushStyle();
    fill(buttonColor);
    ellipse(x, y, size, size);
    popStyle();
  }
  
  void update() { // there is a trick here to fix this problem: switch locations for click and hover
    buttonColor = color(100);
    if (click) {
      buttonColor = color(random(255), random(255), random(255));
    }
    if (hover) {
      buttonColor = color(255, 0, 0);
    }
  }
  
  void run() {
    check();
    update();
    display();
  }
  
  void onClick() {
  }

  void offClick() {
  }

  void onHover() {
  }

  void offHover() {
  }
}