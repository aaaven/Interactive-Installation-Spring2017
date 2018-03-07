class Particle {
  float x, y, z;
  float xSpeed;
  float ySpeed;
  float alpha;
  float alphaSpeed;
  color col;
  String text;
  Particle(float _x, float _y, float _z, color _col) {
    x = _x;
    y = _y;
    z = _z;
    col = _col; 
    alpha = 255;
    alphaSpeed = random(1, 3);
    xSpeed = random(0.02, 0.07);
    ySpeed = random(2, 5);
    if (random(1)>0.5) {
      text = "W";
    } else {
      text = "P";
    }
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
    color updateCol = color(red(col), green(col), blue(col), alpha);
    fill(updateCol);
    //point(x,y,z);
    textAlign(CENTER, CENTER);
    textSize(100);
    pushMatrix();
    translate(x, y, z);
    scale(-1, 1);
    text(text, 0, 0, 0);
    popMatrix();
    popStyle();
  }
}