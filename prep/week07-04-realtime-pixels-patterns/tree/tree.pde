pathfinder[] paths;
void setup() {
  size(800, 600);
  noStroke();
  smooth();
  background(0);
  //ellipseMode(CENTER);
  paths = new pathfinder[1];
  paths[0] = new pathfinder();
}
void draw() {
  //background(0);

  for (int i=0; i<paths.length; i++) {
    PVector loc = paths[i].location;
    float diam = paths[i].diameter;
    fill(random(255));
    ellipse(loc.x, loc.y, diam, diam);
    paths[i].update();
  }
  println(paths.length);
}
void mousePressed() {
  background(0);
  paths = new pathfinder[1];
  paths[0] = new pathfinder();
}