PVector startLoc;
ParticleSystem ps; // declaring a variable ps as type particlesystem

void setup() {
  size(700, 700);
  startLoc = new PVector(width/2, 50);
  ps = new ParticleSystem(); // initializing the variable ps as a particle system, calling the constructor
}

void draw() {
  background(255);
  ps.addParticle();  
  ps.run();
}
