ArrayList<ParticleSystem> systems;

void setup() {
  size(700, 700);
  systems = new ArrayList<ParticleSystem>();
}

void draw() {
  background(255);
  if (mousePressed) {
    systems.add(new ParticleSystem(mouseX, mouseY));
  }

  for (ParticleSystem ps : systems) {
    ps.addParticle();  
    ps.run();
  }
}
