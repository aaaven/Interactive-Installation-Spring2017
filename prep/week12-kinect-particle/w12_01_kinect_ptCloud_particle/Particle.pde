class Particle {
  float x,y,z;
  float xSpeed;
  float ySpeed;
  float alpha;
  float alphaSpeed;
  color col;
  Particle(float _x, float _y, float _z, color _col) {
    x = _x;
    y = _y;
    z = _z;
    col = _col; 
    alpha = 255;
    alphaSpeed = random(1,3);
    xSpeed = random(0.02,0.07);
    ySpeed = random(2,5);
    
  }
  
  void run() {
    if (alpha > 0) {
      alpha -= alphaSpeed;
    } else {
      alpha = 0;
    }
    x = x + sin(frameCount*xSpeed) * 3;
    y -= ySpeed;
    
    pushStyle();
    strokeWeight(3);
    color updateCol = color(red(col),green(col),blue(col),alpha);
    stroke(updateCol);
    point(x,y,z);
    popStyle();
  }
}