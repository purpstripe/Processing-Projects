Particle[] particles;
float randX;
float randY;
float randRad;
int numPart;


void setup() {
  
  numPart = 7;
  particles = new Particle[numPart];
  size(600, 400);
  
  for (int i = 0; i < numPart; i++) {
     randX = random(1) * width;
     randY = random(1) * height;
     randRad = random(1) * 30;
     particles[i] = new Particle(randX, randY, randRad);
  }
}

void draw() {
  
  background(0);
  
  // variable is used to adjust loop size to increase efficiency
  int variable = 1;
  for (int i = 0; i < numPart; i++) {
    for (int j = variable; j < numPart; j++) {
      if(particles[i].overlaps(particles[j])) {
        background(100);
      }
    }
    variable++;
  }
  
  for (int i = 0; i < numPart; i++) {
    particles[i].display();
  } 

  particles[0].x = mouseX;
  particles[0].y = mouseY;
}
