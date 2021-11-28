// A force is a vector that causes an object with mass to accelerate
// data
int bgColor;
int numMovers = 5;
Mover[] movers = new Mover[numMovers];
Attractor a;

void setup() {
  size(640, 360);
  bgColor = 255;
  for(int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1.1, 2), random(width), random(height));
  }
  a = new Attractor();
}

void draw() {
  background(bgColor);
  for(Mover m: movers) {
    PVector force = a.attract(m);
    m.applyForce(force);
    m.update();
    m.edges();
    
    a.hover();
    
    a.display();
    m.display();
  }
}

void mousePressed() {
  
}
