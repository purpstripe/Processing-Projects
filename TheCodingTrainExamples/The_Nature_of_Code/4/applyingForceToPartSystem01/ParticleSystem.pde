class ParticleSystem {
  ArrayList<Particle> a;


  ParticleSystem() {
    a = new ArrayList<Particle>();
  }

  void applyForce(PVector force) {
    for (Particle p : a) {
      p.applyForce(force);
    }
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
