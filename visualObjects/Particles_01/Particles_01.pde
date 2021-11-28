ArrayList<Particle> particles;
int bgColor;

void setup() {
  size(800, 600);
  bgColor = 0xFFb7fff9;
  particles = new ArrayList<Particle>();
}


void draw() {
  background(bgColor);
  translate(width/2, height/2);
  for (int i = 0, len = particles.size(); i < len; i++) {
    particles.get(i).updateMe();
    if (!particles.get(i).dead) {
      particles.get(i).drawMe();
    }
    for (int j = particles.size(); j < 0; j--) {
      if (particles.get(i).dead) {
        particles.remove(i);
      }
    }
  }
}

void mouseReleased() {
  int len = 500; // variable value based off of...
  for (int i = 0; i < len; i++) {
    float velMag = randomGaussian() * 2 + 1;
    float angle = random(1) * 2 * PI;
    // Particle p = new Particle (mouseX - width/2, mouseY - height/2, velMag, angle);
    Particle p = new Particle (0, 0, velMag, angle);
    p.fillColor = 0x50771010;
    particles.add(p);
  }
}