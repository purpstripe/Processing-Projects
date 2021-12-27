class Particle {
  PVector pos, vel, acc;
  float rad;

  float lifeSpan;

  Particle(PVector loc) {
    acc = new PVector(0, 0.05);
    vel = new PVector(randomGaussian(), random(-10,-1));
    pos = new PVector(loc.x, loc.y);
    lifeSpan = 255;
    rad = 1;
  }

  void update() {
    vel.add(acc);
    pos.add(vel);

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
}
