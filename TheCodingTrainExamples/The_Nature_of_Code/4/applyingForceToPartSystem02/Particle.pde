// mover object
class Particle {
  PVector pos, vel, acc;
  float rad;

  float lifeSpan;

  Particle(PVector loc) {
    acc = new PVector(0, 0);
    vel = new PVector(randomGaussian(), randomGaussian());
    pos = loc.copy();
    lifeSpan = 255;
    rad = 10;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    lifeSpan -= 2;
  }

  boolean isDead() {
    return lifeSpan <= 0;
  }

  void display() {
    fill(123, lifeSpan);
    stroke(0, lifeSpan);
    strokeWeight(2);
    ellipseMode(RADIUS);
    ellipse(pos.x, pos.y, rad, rad);
  }

  void edges() {
    if (pos.x < 0) {
      pos.x = 0;
      vel.x *= -1;
    }
    if (pos.x > width) {
      pos.x = width;
      vel.x *= -1;
    }
    if (pos.y > height) {
      pos.y = height;
      vel.y *= -1;
    }
    if (pos.y < 0) {
      pos.y = 0;
      vel.y *= -1;
    }
  }
}
