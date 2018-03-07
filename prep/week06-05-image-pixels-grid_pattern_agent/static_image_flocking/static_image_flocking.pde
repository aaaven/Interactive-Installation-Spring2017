ArrayList balls; 
color[] colors;
int bw = 600, bh = 800;

void setup() {
  size(700, 950);
  smooth(); 
  p5Setup();
  colors = getColors(bw, bh, "1.jpg");
  balls = new ArrayList();   
  for (int i = 0; i < 1800; i++) {
    Vec3D startPoint = new Vec3D (random(0, bw), random(0, bh), 0);
    balls.add(new Ball(startPoint));
  }
}

void draw() {
  background(0);
  noFill();
  pushMatrix();
  translate(50,100);
  for (int i = 0; i < balls.size (); i++) {
    Ball mb = (Ball) balls.get(i);
    ArrayList otherBalls = getOthers(balls, mb);
    mb.run(otherBalls);
  }
  popMatrix();
}

color[] getColors(int w, int h, String fileName) {//"1.jpg"

  PImage img = loadImage(fileName);
  img.resize(w, h);

  color[] _colors = new color[w*h];

  img.loadPixels();
  for (int i =0; i < img.pixels.length; i ++) {
    color c = (color)img.pixels[i];
    _colors[i] = c;
  }
  img.updatePixels();
  //printArray(colors);
  return _colors;
}

ArrayList getOthers(ArrayList oldArray, Ball toRemove) {
  ArrayList otherBalls = new ArrayList();
  for (int i = 0; i < oldArray.size(); i++) {
    Ball other = (Ball) oldArray.get(i);
    if (other != toRemove) {
      otherBalls.add(balls.get(i));
    }
  }
  return otherBalls;
}