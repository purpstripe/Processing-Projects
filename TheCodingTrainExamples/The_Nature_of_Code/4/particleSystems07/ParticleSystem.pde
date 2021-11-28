class ParticleSystem {
  ArrayList<Particle> a;
  PVector startLoc;

  ParticleSystem(float x, float y) {
    a = new ArrayList<Particle>();
    startLoc = new PVector(x, y);
  }

  void addParticle() {
    a.add(new Particle(startLoc));
  }

  void run() {
    for (int i = a.size()-1; i >= 0; i--) { // Loop running backwards to make sure that we do not skip elements!!
      Particle p = a.get(i);
      p.update();
      p.display();

      if (p.isDead()) {
        a.remove(p);
      }
    }
  }
}
