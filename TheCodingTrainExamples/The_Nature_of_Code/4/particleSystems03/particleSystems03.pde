PVector startLoc;
ArrayList<Particle> a;

void setup() {
  size(700, 700);
  startLoc = new PVector(width/2, 50);
  a = new ArrayList<Particle>();
  for (int i = 0; i < 10; i++) {
    a.add(new Particle(startLoc));
  }
}

void draw() {
  background(255);

  for (int i = 0; i < 10; i++) {
    a.get(i).update();
    a.get(i).display();
  }
  //p.update();
  //p.display();

  //if (p.isDead()) {
  //  background(255,0,0);
  //}
}
