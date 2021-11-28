// try to make a simulation like particle flow

ArrayList<Particle> particles;
ArrayList<Point> points;
int numParticles;
int bgColor;
int counter;
float radX, radY;
float k;
float f;
PVector radialVect;

void setup() {
  size(1400, 800); // size of the display screen
  bgColor = 0x00000000; // color of the display screen
  
  counter = 0; // click counter
  points = new ArrayList<Point>(); // array list for all of the points to be added to the screen by mouse press
  Point poi = new Point(0, 0); // initialize a point
  points.add(poi); // appending a single point
  
  k = 700; // force constant for particle point interaction
  f = 0.5; // friction constant
  
  particles = new ArrayList<Particle>(); // array list for particles
  numParticles = 2000; // number of particles to generate
  for (int i = 1; i < numParticles+1; i++) { // generation of the particles
    // orientation of particle placement along the display
    Particle p = new Particle(i * width/numParticles, i * height/numParticles);
    particles.add(p); // appending the particle object p to the array list
    radialVect = new PVector(points.get(0).pos.x - particles.get(i-1).pos.x, points.get(0).pos.y - particles.get(i-1).pos.y);
  }
}


void draw() {
  background(bgColor); // making the background the specified color //<>//
  for (int i = 0, len = particles.size(); i < len; i++) { // iterating through the array list of particles
    radX = 0;
    radY = 0;
    for (int j = points.size() - 1;  j > -1; j--) {
      radX += points.get(j).pos.x - particles.get(i).pos.x;
      radY += points.get(j).pos.y - particles.get(i).pos.y; // defining the radial vetor
      // if (mag(radialVect.x, radialVect.y) <= 5) {
      // radialVect.x =  // figure out how to limit how close you can get to the poi
      //}
      points.get(j).display();
    }
    radialVect = new PVector(radX, radY);
    particles.get(i).update(radialVect, k, f);
    particles.get(i).display();
  }
}


void mouseClicked() { //<>//
  Point poi = new Point(mouseX, mouseY); //<>//
  points.add(poi); //<>//
}

void mouseDragged() {
  counter++;
  points.get(counter % points.size()).pos.x = mouseX;
  points.get(counter % points.size()).pos.y = mouseY;
}

void keyPressed() {
  if (points.size() > 1){
    points.remove(points.size()-1);
  }
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
