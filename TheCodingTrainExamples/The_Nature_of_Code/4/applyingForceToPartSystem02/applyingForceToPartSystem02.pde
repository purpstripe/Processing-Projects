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

  if (keyPressed) {
    PVector wind = new PVector(0.1, 0);
    for (ParticleSystem p : a) {
      p.applyForce(wind);
    }
  }

  for (ParticleSystem ps : a) {

    PVector gravity = new PVector(0, 0.05);
    ps.applyForce(gravity);

    ps.addParticle();
    ps.run();
  }
}
