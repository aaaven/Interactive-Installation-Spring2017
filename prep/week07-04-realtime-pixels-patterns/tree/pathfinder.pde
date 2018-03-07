class pathfinder {
  PVector location;
  PVector velocity;
  float diameter;
  pathfinder() {
    location = new PVector(width/2, height);
    velocity = new PVector(0, -1);
    diameter = 32;
  }
  pathfinder(pathfinder parent) {
    location = parent.location.get();
    velocity = parent.velocity.get();
    float area = PI*sq(parent.diameter/2);
    float newDiam = sqrt(area/2/PI)*2;
    diameter = newDiam;
    parent.diameter = newDiam;
  }
  void update() {
    if (diameter>0.5) {
      location.add(velocity);
      PVector bump = new PVector(random(-1, 1), random(-1, 1));
      bump.mult(0.1);
      velocity.add(bump);
      velocity.normalize();
      if (random(0, 1)<0.02) {
        paths = (pathfinder[]) append(paths, new pathfinder(this));
      }
    }
  }
}