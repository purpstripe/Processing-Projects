Particle particle1;
Particle particle2;
Particle particle3;

void setup() {
  
  size(600, 400);
  particle1 = new Particle(100, 100, 50);
  particle2 = new Particle(500, 200, 100);
  particle3 = new Particle();
}

void draw() {
  background(0);
  
  if(particle1.overlaps(particle2)) {
    background(100);
  }
  
  
  particle2.x = mouseX;
  particle2.y = mouseY;
  
  particle1.display();
  particle2.display();
  particle3.display();
}