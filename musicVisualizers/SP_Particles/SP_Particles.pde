import ddf.minim.analysis.*; //<>// //<>// //<>// //<>// //<>// //<>// //<>//
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
FFT fftLog;

Envelope rotEnv;
Envelope radEnv;
Envelope radEnv2;

ArrayList<Particle> particles;
int bgColor;

int startBand;
int endBand;

float rad;
float rad2;

void setup() {
  size(700, 700);
  bgColor = 0x000916;
  particles = new ArrayList<Particle>();

  // minum
  minim = new Minim(this);
  minim.debugOn();
  jingle = minim.loadFile("jingle.mp3", 1024);
  jingle.play();
  // loop music file
  jingle.loop();

  fftLog = new FFT(jingle.bufferSize(), jingle.sampleRate());

  // calculate averages based on a miminum octave width of 22 Hz
  // split each octave into three bands
  // this should result in 30 averages
  fftLog.logAverages(22, 3);

  rectMode(CENTER);
  rotEnv = new Envelope(60);
  radEnv = new Envelope(25);
  radEnv2 = new Envelope(20);
}


void draw() {
  // music
  fftLog.forward(jingle.mix);

  // env
  rotEnv.update();
  radEnv.update();
  radEnv2.update();

  // drawing
  background(bgColor);

  translate(width/2, height/2);

  rot();
  
  rad = radEnv.value * 70;
  rad2 = radEnv2.value * 30;
  
  drawRect();
  
  drawBalls();
  
  fill(255);
  ellipse(0, 0, rad, rad);

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

  startBand = 13;
  endBand = 15;
  if (threasholdPassed(startBand, endBand, 58)) {
    rotEnv.start();
  }

  startBand = 24;
  endBand = 26;
  if (threasholdPassed(startBand, endBand, 8)) {
    radEnv.start();
  }

  startBand = 1;
  endBand = 3;
  if (threasholdPassed(startBand, endBand, 85)) {
    int len = 100;
    particlePop(len);
  }
  
  startBand = 25;
  endBand = 30;
  if (sumThreasholdPassed(startBand, endBand, 16)) {
    radEnv2.start();
  }
}


boolean threasholdPassed(int startBand, int len, float threashold) {
  for (int i = startBand; i < len; i++) {  
    if (fftLog.getAvg(i) > threashold) {
      return true;
    }
  }
  return false;
}

boolean sumThreasholdPassed(int startBand, int len, float threashold) {
  float sum = 0;
  for (int i = startBand; i < len; i++) {  
    sum = sum + fftLog.getAvg(i);
  }
  if (sum > threashold) {
     return true;
  }
  return false;
}

void particlePop(int len) {
  for (int i = 0; i < len; i++) {
    float velMag = randomGaussian() * 2 + 1;
    float angle = random(1) * 2 * PI;
    // Particle p = new Particle (mouseX - width/2, mouseY - height/2, velMag, angle);
    Particle p = new Particle (0, 0, velMag, angle);
    particles.add(p);
  }
}

void rot() {
  rotate(rotEnv.value * TWO_PI);
}

void drawRect() {
  strokeWeight(1 + 10*radEnv.value);
  stroke(255, 255, 255);
  rect(0, 0, radEnv.value*width/4, radEnv.value*height/4);
  stroke(110, 19, 163);
  rect(0, 0, radEnv.value*width/2, radEnv.value*height/2);
  stroke(255, 255, 255);
  rect(0, 0, radEnv.value*width, radEnv.value*height);
}

void drawBalls() {
  noStroke();
  fill(255);
  ellipse (-width/2, height/2, rad2, rad2);
  ellipse (width/2, -height/2, rad2, rad2);
  ellipse (-width/2, -height/2, rad2, rad2);
  ellipse (width/2, height/2, rad2, rad2);
}