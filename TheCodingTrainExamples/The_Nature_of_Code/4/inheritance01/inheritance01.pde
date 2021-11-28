ArrayList<ParticleSystem> a;

void setup() {
  size(700, 700);
  a = new ArrayList<ParticleSystem>();
}

void draw() {
  background(255);
  if (mousePressed) {
    a.add(new ParticleSystem(mouseX, mouseY));
  }

  for (ParticleSystem ps : a) {
    ps.addParticle();
    ps.run();
  }
}
