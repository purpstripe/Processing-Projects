class Mover {
  PVector pos, vel, acc;
  float mass, rad;

  Mover() {
    pos = new PVector(random(1,width-1), height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = random(0.5, 3);
    rad = mass * 20;
  }

  // Newton's 2nd
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    // vel.limit(5);
    
    // wiping out acc for proper force application - does not continually accumulate
    acc.mult(0);
  }

  void edges() {
    if (pos.x > width) {
      pos.x = width;
      vel.x *= -1;
    }
    if (pos.x < 0) {
      pos.x = 0;
      vel.x *= -1;
    }
    if (pos.y > height) {
      pos.y = height; //<>//
      vel.y *= -1; //<>//
    }
    if (pos.y < 0) {
      pos.y = 0;
      vel.y *= -1;
    }
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(123,100);
    ellipseMode(RADIUS);
    ellipse(pos.x, pos.y, rad, rad);
  }
}
