// A force is a vector that causes an object with mass to accelerate
// data
int bgColor;
Mover[] movers;

void setup() {
  size(640, 360);
  bgColor = 255;
  movers = new Mover[5];
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {
  background(bgColor);
 
  for (Mover m : movers) {
    PVector gravity = new PVector(0, 0.2);
    gravity.mult(m.mass); // scaling by mass to make all obj fall with the same acc
    m.applyForce(gravity);
    
    if (mousePressed) {
      PVector drag = m.vel.copy();
      drag.normalize();
      float c = -0.02;
      float speed = m.vel.mag();
      drag.mult(c*speed*speed);
      m.applyForce(drag);
    }
    
    // friction
    if (m.contact) {
      PVector friction = m.vel.copy();
      friction.normalize();
      float normForce = -1 * gravity.copy().mag() * m.mass; // mg
      friction.mult(normForce);
      float c = 0.3;
      friction.mult(c);
      m.applyForce(friction);
    }
  
    m.update();
    m.edges();
    m.display();
  }
}
