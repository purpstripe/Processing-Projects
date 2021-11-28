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
    
    PVector wind = new PVector(0.1, 0);
    if (mousePressed) {
      m.applyForce(wind);
    }
    
    // friction
    if (m.contact) {
      PVector friction = m.vel.copy();
      friction.normalize();
      float normForce = -1 * gravity.copy().mag() * m.mass; // mg
      friction.mult(normForce);
      float c = 1.1;
      friction.mult(c);
      m.applyForce(friction);
    }
    
    if(m.contactW) {
      PVector friction = m.vel.copy();
      friction.normalize();
      float normForce = -1 * wind.copy().mag(); // mg
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
