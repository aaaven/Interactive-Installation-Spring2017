pathfinder[] paths;
color[] colors;

void setup() {
  size(800, 600);
  noStroke();
  smooth();
  background(255);
  //ellipseMode(CENTER);
  setupCam();
  paths = new pathfinder[1];
  paths[0] = new pathfinder();
}
void draw() {
  //background(0);
  colors = getColors(cam.width, cam.height);
  if (colors.length > 0) {

  for (int i=0; i<paths.length; i++) {
    PVector loc = paths[i].location;
    float diam = paths[i].diameter;
    paths[i].update();
    fill(colors[paths[i].index]);
    ellipse(loc.x, loc.y, diam, diam);
  }
  println(paths.length);
  
  }
}
void mousePressed() {
  background(0);
  paths = new pathfinder[1];
  paths[0] = new pathfinder();
}