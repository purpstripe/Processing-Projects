ArrayList<Particle> particles;
int bgColor;

void setup() {
  size(800, 600);
  bgColor = 0x00000000;
  particles = new ArrayList<Particle>();
}


void draw() {
  background(bgColor);
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

void mouseDragged() {
  int len = 5;
  for (int i = 0; i < len; i++) {
    float velMag = randomGaussian() ;
    float angle = random(1) * PI * 2;
    // Particle p = new Particle (mouseX - width/2, mouseY - height/2, velMag, angle);
    Particle p = new Particle (mouseX, mouseY, velMag, angle);
    //p.fillColor = 0x50771010;
    particles.add(p);
  }
}

//void mousePressed() {
//  int len = 50;
//  for (int i = 0; i < len; i++) {
//    float velMag = randomGaussian() ;
//    float angle = random(1) * PI * 2;
//    // Particle p = new Particle (mouseX - width/2, mouseY - height/2, velMag, angle);
//    Particle p = new Particle (mouseX, mouseY, velMag, angle);
//    //p.fillColor = 0x50771010;
//    particles.add(p);
//  }
//}