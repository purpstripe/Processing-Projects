ArrayList<Particle> particles; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
int bgColor;

float x;
float y;
float t; 
float numWaves;
float amp;
float len;

Envelope waveEnv;

void setup() {
  size(600, 600);
  bgColor = 0x000000;
  background (bgColor);
  numWaves = 1;

  particles = new ArrayList<Particle>();
  
  waveEnv = new Envelope(200);
}

void draw() {
  background (bgColor);

  for (int i = 0, len = particles.size(); i < len; i++) {
    particles.get(i).updateMe();
    if (!particles.get(i).dead) {
      particles.get(i).drawMe();
    }
    // loop backwards for removal
    for (int j = particles.size(); j < 0; j--) {
      if (particles.get(i).dead) {
        particles.remove(i);
      }
    }
  }
}

void mouseReleased() {
  //waveEnv.start(); //<>//
  //while(waveEnv.running){ //<>//
    //if (waveEnv.value % .1 < .09) //<>//
    //{
      background (bgColor);
      len = 80;
      particlePop(len);
    //}
    //waveEnv.update(); //<>//
  //}
}

void particlePop(float len) {
  for (int i = 0; i < len; i++) {
    float velMag = 0; // randomGaussian() * 2 + 1;
    float angle = 0;// random(1) * 2 * PI;
    amp = height/3;
    t = i/len;
    x = t * width;
    y = height - abs(amp * sin(numWaves * PI * t));
    // Particle p = new Particle (mouseX - width/2, mouseY - height/2, velMag, angle);
    Particle p = new Particle (x, y, velMag, angle);
    particles.add(p);
  }
}