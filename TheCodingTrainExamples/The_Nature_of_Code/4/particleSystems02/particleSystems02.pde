PVector startLoc;
Particle p;

void setup() {
  size(700, 700);
  startLoc = new PVector(width/2, 50);
  p = new Particle(startLoc);
}

void draw() {
  background(255);
  
  p.update();
  p.display();
  
  if (p.isDead()) {
    background(255,0,0);
  }
}
