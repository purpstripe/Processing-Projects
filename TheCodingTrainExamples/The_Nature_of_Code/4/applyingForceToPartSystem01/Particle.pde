// mover object
class Particle {
  PVector pos, vel, acc;
  float rad;

  float lifeSpan = 255;

  Particle(PVector start) {
    acc = new PVector(0, 0.05);
    vel = new PVector(random(-1, 1), random(-1, 1));
    pos = start.copy();
    rad = 10;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }


  void update() {
    vel.add(acc);
    pos.add(vel);
    
    acc.mult(0);

    lifeSpan = 255 * (1 - pos.y/height);
  }

  boolean isDead() {
    return lifeSpan <= 1;
  }

  void display() {
    fill(123, lifeSpan);
    stroke(0, lifeSpan);
    strokeWeight(2);
    ellipseMode(RADIUS);
    ellipse(pos.x, pos.y, rad, rad);
  }
}
