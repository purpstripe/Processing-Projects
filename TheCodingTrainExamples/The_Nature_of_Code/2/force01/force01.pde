// A force is a vector that causes an object with mass to accelerate
// data
int bgColor;
Mover m;

void setup() {
  size(640, 360);
  bgColor = 255;
  m = new Mover();
}

void draw() {
  background(bgColor);
  PVector gravity = new PVector(0, 0.2);
  m.applyForce(gravity);

  if (mousePressed) {
    PVector wind = new PVector(0.1, 0);
    m.applyForce(wind);
  }

  m.update();
  m.edges();
  m.display();
}
