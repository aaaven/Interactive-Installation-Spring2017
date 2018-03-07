//this is the button class
class Button {
  float x, y, size;
  int result = 0;
  color buttonColor = color(100);
  boolean click;
  boolean hover;

  Button(float _x, float _y, float _size) {
    x = _x;
    y = _y;
    size = _size;
  }
  void check() {
    hover = false;
    click = false;
    float distance = dist(x, y, mouseX, mouseY);
    if ( distance < size/2 && !mousePressed) { 
      hover = true; //mouse hover
    } 
    if (distance < size/2 && mousePressed) { 
      click = true; //click
    }
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