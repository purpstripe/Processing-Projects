// A force is a vector that causes an object with mass to accelerate
// data
int bgColor;
Mover m;
Attractor a;

void setup() {
  size(640, 360);
  bgColor = 255;
  m = new Mover();
  a = new Attractor();
}

void draw() {
  background(bgColor);
  
  PVector force = a.attract(m);
  m.applyForce(force);
  m.update();
  m.edges();
  
  a.hover();
  
  a.display();
  m.display();
}

void mousePressed() {
  
}
