// try to make a simulation like particle flow

ArrayList<Particle> particles;
Point point;
int numParticles;
int bgColor;
int counter;
float k;
PVector radialVect;


void setup() {
  size(1200, 800); // size of the display screen
  bgColor = 0x00000000; // color of the display screen
  
  point = new Point(0,0);
  radialVect = new PVector(0, 0);

  k = 700; // force constant for particle point interaction
  particles = new ArrayList<Particle>(); // array list for particles
  numParticles = 500; // number of particles to generate
  for (int i = 1; i < numParticles+1; i++) { // generation of the particles
    // orientation of particle placement along the display
    Particle p = new Particle(i * width/numParticles, i * height/numParticles);
    particles.add(p); // appending the particle object p to the array list
    radialVect.x = point.pos.x - particles.get(i-1).pos.x;
    radialVect.y = point.pos.y - particles.get(i-1).pos.y;
  }
}


void draw() {
  background(bgColor); // making the background the specified color
  for (int i = 0, len1 = particles.size(); i < len1; i++) { // iterating through the array list of particles //<>//
    radialVect.x = point.pos.x - particles.get(i).pos.x;
    radialVect.y = point.pos.y - particles.get(i).pos.y; // defining the radial vetor 
    // radialVect = new PVector(point.pos.x - particles.get(i).pos.x, point.pos.y - particles.get(i).pos.y);
    // if (mag(radialVect.x, radialVect.y) <= 5) {
    // radialVect.x =  // figure out how to limit how close you can get to the poi
    //}
    particles.get(i).update(radialVect, k);
    particles.get(i).display();
  }
}


void mousePressed() {
  point.pos.x = mouseX;
  point.pos.y = mouseY;
}


/*
void draw() {
  background(bgColor);
  for (int i = 0, len = particles.size(); i < len; i++) {
    particles.get(i).update();
    if (!particles.get(i).dead) {
      particles.get(i).display();
    }
    for (int j = particles.size(); j < 0; j--) {
      if (particles.get(i).dead) {
        particles.remove(i);
      }
    }
  }
}
*/


/*
void mouseDragged() {
  int len = 5;
  for (int i = 0; i < len; i++) {
    float velMag = randomGaussian() ;
    float angle = random(1) * PI * 2;
    // Particle p = new Particle (mouseX - width/2, mouseY - height/2, velMag, angle);
    Particle p = new Particle (mouseX, mouseY, velMag, angle);
    particles.add(p);
  }
}
*/


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
