class Mover {
  PVector pos, vel, acc; // handling the position and derivatives
  float rad, mass; // handling the volume and mass
  
  Mover(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    rad = 30;
    mass = 10;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0); // clearing the acc after each instant that a force is applied
  }
  
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(123);
    ellipseMode(RADIUS);
    ellipse(pos.x, pos.y, rad, rad);
  }
  
  void edges() {
    if(pos.x < 0) {
      pos.x = width;
    } else if(pos.x > width) {
      pos.x = 0;
    }
    
    if(pos.y > height) {
      vel.y *= -1;
      pos.y = height;
    }
  }
}
