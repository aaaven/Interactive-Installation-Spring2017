class trackColor {
  PImage img;
  color pcolor, dcolor;
  int sumX = 0, sumY = 0, count = 0, t = 20;
  PVector pos; 
  trackColor() {
    img = createImage(640, 360, ARGB); //ARGB, if you want to add alpha  //not RGBA
    pcolor = color(0, 0, 0);
    pos = new PVector(0, 0);
  }

  void init() {
    img.loadPixels();
    sumX = 0;
    sumY = 0;
    count = 0;
  }

  void updatePixel(int r, int g, int b, int i, int x, int y) {
    int tr = (int)abs(r - red(pcolor));
    int tg = (int)abs(g - green(pcolor));
    int tb = (int)abs(b - blue(pcolor));

    if (tr < t && tg < t && tb < t) {
      img.pixels[i] = color(255, 255, 255);
      sumX += x;
      sumY += y;
      count ++;
    } else {
      img.pixels[i] = color(0, 0);
    }
  }
  void updateImg() {
    //display PImage img instead of cam object
    img.updatePixels();
    image(img, 0, 0);

    //get average
    if (count != 0) {
      pos.x = sumX/count;
      pos.y = sumY/count;
      println("pos" + pos.x + " , " + pos.y);
    }
  }
  void displayColor(PVector cPos) {
    pushStyle();
    stroke(pcolor);
    fill(pcolor);
    strokeWeight(1);
    line(pos.x, 0, pos.x, height);
    line(0, pos.y, width, pos.y);
    rect(cPos.x, cPos.y, 20, 20);
    popStyle();
  }
}