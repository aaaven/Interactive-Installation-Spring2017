class Button {
  color buttonColor = color(255);
  float _x, _y, _size;

  Button(float x, float y, float size) { // constuctor
    _x = x;
    _y = y;
    _size = size;
  }

  void display() {
    //------------dispaly---------------------
    fill(buttonColor);
    ellipse(_x, _y, _size, _size);    //center: width/2,height/2; radius: size
    //------------dispaly---------------------
  }
  void checkDistance() {
    // -----------------check distance-------------------
    float distance  = dist(_x, _y, mouseX, mouseY); // mouse loc---center
    if (distance < _size/2) {
      if (mousePressed) {
        //hover and click

        buttonColor = color(random(255), random(255), random(255));
        _x = random(width);
        _y = random(height);
        
    } else {//hover non-click
        buttonColor = color(100);
        _size += random(-1,1);
      }
    } else {
      buttonColor= color(255);
    }
  }
}