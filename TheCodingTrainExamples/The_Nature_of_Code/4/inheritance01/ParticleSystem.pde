class ParticleSystem {
  ArrayList<Particle> a;
  PVector startLoc;

  ParticleSystem(float x, float y) {
    a = new ArrayList<Particle>();
    startLoc = new PVector(x, y);
  }

  void addParticle() {    
    if (random(1) < 0.4) {
      a.add(new SquareParticle(startLoc));
    }
    else {
      a.add(new Particle(startLoc));
    }
    
  }

  void run() {
    for (int j = a.size() - 1; j >= 0; j--) {
      Particle p = a.get(j); // polymorphism
      p.update();
      p.display();
      p.edges();
      if (p.isDead()) {
        a.remove(j);
      }
    }
  }
}
