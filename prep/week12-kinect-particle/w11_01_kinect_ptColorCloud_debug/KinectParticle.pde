class KinectParticle {
  PVector pos, vel, g;
  color col;
  KinectParticle(PVector position) {
    pos = new PVector(position.x, position.y, position.z);
    vel = new PVector(random(5), random(5), random(5));
    col = color(0, 0);
    g = new PVector(0, 1, 0);
  }

  void updateKinect(float x, float y, float z, color kcol) {
    pos = new PVector(x, y, z);
    col = color(red(kcol), green(kcol), blue(kcol), alpha(kcol));
  }

  void lerpToKinect(float x, float y, float z) {
    pos.lerp(x, y, z, 0.5);
  }

  void updateParticle() {
    //move to center
    vel.add(g);
    pos.add(vel);
  }

  void checkEdge() {
    if (pos.x < 0 ) {
      pos.x = 0;
      vel.x *= -1;
    }
    if (pos.x > width ) {
      pos.x = width;
      vel.x *= -1;
    }
    if (pos.y < 0 ) {
      pos.y = 0;
      vel.y *= -1;
    }
    if (pos.y > height ) {
      pos.y = height;
      vel.y *= -1;
    }
    if (pos.z < depthRangeMin ) {
      pos.z = depthRangeMin;
      vel.z *= -1;
    }
    if (pos.z > depthRangeMax ) {
      pos.z = depthRangeMax;
      vel.z *= -1;
    }
  }

  void display() {
    stroke(col);
    strokeWeight(imgScale/2);
    point(imgScale*pos.x, imgScale*pos.y, pos.z);
  }
}