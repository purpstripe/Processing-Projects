class Mover {
  PVector pos, vel, acc;
  float mass, rad;
  boolean contact, contactW;

  Mover() {
    pos = new PVector(random(1,width-1), rad);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = random(0.5, 3);
    rad = mass * 20;
    contact = false;
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
    contact = false;
    if (pos.x > width - rad) {
      contactW = true;
      pos.x = width - rad;
      vel.x *= -1;
    }
    if (pos.x < 0 + rad) {
      contactW = true;
      pos.x = 0 + rad;
      vel.x *= -1;
    }
    if (pos.y > height - rad) {
      contact = true;
      pos.y = height - rad; //<>// //<>//
      vel.y *= -1; //<>// //<>//
    }
    if (pos.y < 0 + rad) {
      contact = true;
      pos.y = 0 + rad;
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
