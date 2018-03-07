Button button;

class Button {
  color buttonColor = color(100);
  boolean click;
  boolean preClick = false;
  float disCheck;
  Button(float _disCheck) {
    disCheck = _disCheck;
  }
  void check(float dis) {
    click = false;
    float distance = dis - disCheck;

    //check hover and click
    if ( distance < 0) {  
      click = true; 
      //println("mouse is clicking");
      isClicking();
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

    preClick = click;
  }

  void display() {
    pushStyle();
    fill(buttonColor);
    ellipse(width/2, height/2, 100, 100);
    popStyle();
  }

  void update() {
    buttonColor = color(100);
    if (click) {
      buttonColor = color(random(255), random(255), random(255));
    }
  }

  void run(float dis) {
    //update();
    check(dis);
    display();
  }

  void onClick() {
    // event for on click
    buttonColor = color(0, 255, 255);
  }

  void offClick() {
    //
    buttonColor = color(255, 0, 255);
  }

  void isClicking() {
    buttonColor = color(random(255), random(255), random(255));
  }
}