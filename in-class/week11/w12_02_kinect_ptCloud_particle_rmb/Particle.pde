class Particle {
  float x, y, z;
  float xSpeed;
  float ySpeed;
  float alpha;
  float alphaSpeed;
  color col;
  char text;
  float textSize;

  Particle(float _x, float _y, float _z, color _col) {
    x = _x;
    y = _y;
    z = _z;
    col = _col; 
    alpha = 255;
    alphaSpeed = random(5, 15);
    xSpeed = random(0.02, 0.07);
    ySpeed = random(20, 40);
    textSize = random(30, 50);
    float seed = random(3);
    if (seed > 2) {
      text = 'W';
    } else if (seed > 1) {
      text = 'P';
    } else {
      text = 'P';
    }
  }

  void run() {
    if (alpha > 0) {
      alpha -= alphaSpeed;
    } else {
      alpha = 0;
    }
    x = x + sin(frameCount*xSpeed) * 15;
    y -= ySpeed;
    textSize += 10;
    pushStyle();
    //strokeWeight(3);
    color updateCol = color(red(col), green(col), blue(col), alpha);
    if (debug) { 
      stroke(updateCol);
      strokeWeight(5);
      point(x, y, z);
    } else {
      noStroke();
      fill(updateCol);
      textSize(textSize);
      pushMatrix();
      translate(x,y,z);
      scale(-1,1);
      //text(text, 0,0,0);
      image(m,0,0);
      popMatrix();
    }
    popStyle();
  }
}