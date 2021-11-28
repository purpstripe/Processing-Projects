class Ball {
  PVector loc;
  PVector vel;
  int rad;
  
  Ball() {
    rad = 10;
    loc = new PVector(width/2, height/2);
    vel = new PVector(1,1);
  }
  
  void update() {
    loc.add(vel);
  }
  
  void bounce() {
    if ((loc.x > width - rad) || (loc.x < 0 + rad)) {
      vel.x *= -1;
    }
    if ((loc.y > height - rad) || (loc.y < 0 + rad)) {
      vel.y *= -1;
    }
  }
  
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(140, 160, 130);
    ellipseMode(RADIUS);
    ellipse(loc.x, loc.y, rad, rad);
  }
}
