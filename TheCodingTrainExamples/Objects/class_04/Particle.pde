class Particle {
  float x, y;
  float rad;

  Particle() {
    x = random(width);
    y = random(height);
    rad = random(20, width/5);
  }

  Particle(float tempX, float tempY, float tempRad) {
    x = tempX;
    y = tempY;
    rad = tempRad;
  }

  void display() {
    strokeWeight(2);
    stroke(255);
    fill(255);
    ellipseMode(RADIUS);
    ellipse(x, y, rad, rad);
  }

  boolean overlaps(Particle other) {
    float dist = dist(x, y, other.x, other.y);
    if (dist < rad + other.rad) {
      return true;
    } else {
      return false;
    }
  }
}