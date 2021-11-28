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
      PVector wind = new PVector(0.1, 0);
      m.applyForce(wind);
    }
  
    m.update();
    m.edges();
    m.display();
  }
}
