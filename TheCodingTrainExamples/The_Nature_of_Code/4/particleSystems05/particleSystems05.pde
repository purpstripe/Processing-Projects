PVector startLoc;
ArrayList<Particle> a; // declaring the variable and giving it the type of arraylist of particles named a

void setup() {
  size(700, 700);
  startLoc = new PVector(width/2, 50);
  a = new ArrayList<Particle>(); // creating the "empty bucket", the arraylist, and pointing the variable a to the arraylist memory location
}

void draw() {
  background(255);
  a.add(new Particle(startLoc));

  for (int i = a.size()-1; i >= 0; i--) { // Loop running backwards to make sure that we do not skip elements!!
    Particle p = a.get(i);
    p.update();
    p.display();

    if (p.isDead()) {
      a.remove(p);
    }
  }

  //if (a.size() > 20) { // limiting the size of the arraylist and removing the necessary particle
  //  a.remove(0);
  //}
}
