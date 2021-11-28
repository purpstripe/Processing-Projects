PVector startLoc;
ParticleSystem ps; // declaring a variable ps as type particlesystem

void setup() {
  size(700, 700);
  startLoc = new PVector(width/2, 50);
  ps = new ParticleSystem(); // initializing the variable ps as a particle system, calling the constructor
}

void draw() {
  background(255);
  
  // applied forces
  PVector gravity = new PVector(0,0.05);
  ps.applyForce(gravity);
  
  if (mousePressed) {
      PVector wind = new PVector(5,0);
      ps.applyForce(wind);
  }
  
  // code that adds particles to the particle system and tells the ps to run
  ps.addParticle();  
  ps.run();
}
