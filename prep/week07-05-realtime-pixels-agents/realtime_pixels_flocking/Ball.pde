import toxi.geom.*;
class Ball {
  float radius = 15;
  Vec3D pos = new Vec3D(); 
  Vec3D vel = new Vec3D();
  Vec3D accel = new Vec3D();
  Vec3D t;
  Ball(Vec3D pos_) {
    pos = pos_;
    t = new Vec3D(pos_.x, pos_.y, pos_.z);
    vel = new Vec3D(random(-2, 2), random(-2, 2), 0);
  }
  void run(ArrayList others) {
    if (toFlock) {
      update();
      bounce();
      flock(others);
    } else {
      moveLerp();
    }
    display();
    //gravity();
  }

  void display() {
    int index = int(pos.y)*cam.width + int(pos.x);
    stroke(colors[index]);
    point(pos.x, pos.y);
  }

  void update() {
    vel.addSelf(accel); 
    vel.limit(2);
    pos.addSelf(vel);
  }

  void bounce() {
    float sx = radius/2, ex = bw-radius/2, 
      sy = radius/2, ey = bh - radius/2;
    if (pos.x < sx) {      //vel = vel.rotateZ(vel.angleBetween(new Vec3D(0, 1, 0)));
      pos.x = sx;
      vel.x *= -2;
    } else if ( pos.x > ex) {
      pos.x = ex;      
      vel.x *= -2;
    }
    if (pos.y < sy) {
      pos.y = sy;
      vel.y *= -2;
    } else if (pos.y > ey) {
      pos.y = ey;
      vel.y *= -2;
    }
  }

  void gravity() {
    vel.y += 0.2;
  }

  void lineBetween(ArrayList others) {
    for (int i = 0; i < others.size (); i ++) {
      Ball otherBall = (Ball) others.get(i); 
      if (this != otherBall) {
        float distance = pos.distanceTo(otherBall.pos);
        float disCheck = 5*radius;
        if (distance >0 && distance < disCheck) {
          stroke(255, 0, 0);
          strokeWeight(0.3);
          line(pos.x, pos.y, otherBall.pos.x, otherBall.pos.y);
        }
      }
    }
  }

  void flock(ArrayList others) {
    separate(sepatateMagnitude, others);
    cohesion(cohesionMagnitude, others);
    align(alignMagnitude, others);
    //lineBetween(others);
  }

  void separate(float magnitude, ArrayList others) {
    Vec3D _accel = new Vec3D();
    int count = 0;
    for (int i = 0; i < others.size (); i ++) {
      Ball otherBall = (Ball) others.get(i); 
      if (this != otherBall) {
        float distance = pos.distanceTo(otherBall.pos);
        if (distance > 0 && distance < 2*radius) {
          Vec3D vecBetween = pos.sub(otherBall.pos); 
          vecBetween.normalizeTo(1.0/distance);
          _accel.addSelf(vecBetween);
          count ++;
        }
      }
    }
    if (count > 0) {
      _accel.scaleSelf(1.0/count);//control
    }
    _accel.scaleSelf(magnitude);
    accel.addSelf(_accel);
  }

  void cohesion(float magnitude, ArrayList others) {
    Vec3D sum = new Vec3D();
    int count = 0;
    for (int i = 0; i < others.size (); i ++) {
      Ball otherBall = (Ball) others.get(i);
      if (this != otherBall) {
        float distance = pos.distanceTo(otherBall.pos);
        if (distance > 0 && distance < 8*radius) {
          sum.addSelf(otherBall.pos);
          count ++;
        }
      }
    }
    if (count > 0) {
      sum.scaleSelf(1.0/count);
    }
    Vec3D _accel = sum.sub(pos);
    _accel.scaleSelf(magnitude);
    accel.addSelf(_accel);
  }

  void align(float magnitude, ArrayList others) {
    Vec3D _accel = new Vec3D();
    int count = 0;
    for (int i = 0; i < others.size (); i ++) {
      Ball otherBall = (Ball) others.get(i); 
      if (this != otherBall) {
        float distance = pos.distanceTo(otherBall.pos);
        if (distance > 0 && distance < 2*radius) {
          _accel.addSelf(otherBall.vel);
          count ++;
        }
      }
    }
    if (count > 0) {
      _accel.scaleSelf(1.0/count);
    }
    _accel.scaleSelf(magnitude);
    accel.addSelf(_accel);
  }

  void moveLerp() {
    pos.x = lerp(pos.x, t.x, 0.5);
    pos.y = lerp(pos.y, t.y, 0.5);
  }
}