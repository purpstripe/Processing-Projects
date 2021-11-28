class Mover {
  PVector pos, vel, acc;
  int rad, mass;

  Mover() {
    pos = new PVector(width/2, height/4);
    vel = new PVector(2, 0);
    acc = new PVector(0, 0);
    mass = 5;
    rad = mass * 2;
  }

  // Newton's 2nd
  void applyForce(PVector force) {
    acc.add(force);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    // vel.limit(5);
    
    // wiping out acc for proper force application - does not continually accumulate
    acc.mult(0);
  }

  void edges() {
    if (pos.x > width - rad) {
      pos.x = width - rad;
      vel.x *= -1;
    }
    if (pos.x < 0 + rad) {
      pos.x = 0 + rad;
      vel.x *= -1;
    }
    if (pos.y > height - rad) {
      pos.y = height - rad; //<>//
      vel.y *= -1; //<>//
    }
    if (pos.y < 0 + rad) {
      pos.y = 0 + rad;
      vel.y *= -1;
    }
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(123);
    ellipseMode(RADIUS);
    ellipse(pos.x, pos.y, rad, rad);
  }
}
