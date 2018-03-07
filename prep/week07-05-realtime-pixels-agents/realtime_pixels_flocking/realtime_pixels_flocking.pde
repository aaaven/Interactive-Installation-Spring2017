ArrayList balls; 
color[] colors;
int bw = 640, bh = 360;
boolean toFlock = true;

void setup() {
  size(740, 510);
  smooth(); 
  p5Setup();
  setupCam();  
  balls = new ArrayList();   
  //blendMode(ADD);

  for (int y = 0; y < bh; y+=10) { 
    for (int x = 0; x < bw; x+=10) {
      Vec3D startPoint = new Vec3D (x, y, 0);
      balls.add(new Ball(startPoint));
    }
  }
}

void draw() {
  colors = getColors(cam.width, cam.height);
  background(0);
  noFill();
  pushMatrix();
  translate(50, 100);
  if (colors.length > 0) {
    for (int i = 0; i < balls.size (); i++) {
      Ball mb = (Ball) balls.get(i);
      mb.run(balls);
    }
    //image(cam,0,0);
  }
  popMatrix();
}

void keyPressed() {
  if (key ==' ') {
    toFlock = !toFlock;
  }
}