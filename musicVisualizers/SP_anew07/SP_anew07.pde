import ddf.minim.analysis.*;
import ddf.minim.*;

// music
Minim minim;  
AudioPlayer jingle;
FFT fftLog;

// envelope
Envelope snareEnv;
Envelope kickEnv;
Envelope hiHatEnv;
Envelope colorEnv;

// display data
float x;
float y;
PVector pos;
float ballSize;

float[] distribution = new float[360];

int startBand;
int endBand;


void setup() {

  size(1000, 800);

  smooth();

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

  // envelopes
  kickEnv = new Envelope(70);
  snareEnv = new Envelope(70);
  hiHatEnv = new Envelope(30);
  colorEnv = new Envelope(30);

  // spikey ball
  for (int i = 0; i < distribution.length; i++) {
    distribution[i] = int(randomGaussian() * 90);
  }
  
    // ball
  x = width/2;
  y = height/2;
}


//<>//<>//<>//<>//<>//<>//


void draw() {
  background(0);

  // music
  fftLog.forward(jingle.mix);

  // color data
  int startColor = 0xffffffff;
  int endColor = 0xff000000; // 0xFFFFFFFF

  // envelope
  kickEnv.update();
  snareEnv.update();
  hiHatEnv.update();
  colorEnv.update();

  float shift = kickEnv.value*(30); 
  float rad1 = snareEnv.value * 25 + 100;
  float rad2 = hiHatEnv.value*(100);
  int col = lerpColor(startColor, endColor, colorEnv.value);


  // drawing
  
  fill(col);
  int numCircles = 8;
  int half = numCircles/2;
  beginShape(LINES);
  for (int i = 0, len = numCircles; i < len; i++) {
    
    
    if (i <= half) {
      x = ((i) * width/half);
    }
    else { 
      x = width - ((i) * width/half) % width;  
    }
    y = sin(i*PI/half) * 225 + height/2;
    
    pos = new PVector(x, y);
    translate(0, 0);
    
    stroke(col);
    strokeWeight(3);
    vertex (x, y);
    noStroke();
    ellipse(pos.x, pos.y, rad2, rad2);
  }
  endShape();
  
  stroke(255);
  strokeWeight(1);
  translate(width/2, height/2);
  for (int i = 0; i < distribution.length; i++) {
    rotate(TWO_PI/distribution.length);
    float dist = abs(distribution[i]);
    line(rad1, 0, dist, shift);
  }
  
  //int startBand = 2;
  //int endBand = 5;
  //if (threasholdPassed(startBand, endBand, 75)) { 
  //  kickEnv.start();
  //}
  
  startBand = 15;
  endBand = 17;
  if (sumThreasholdPassed(startBand, endBand, 9.8)) {
    kickEnv.start();
  }
  
  startBand = 25;
  endBand = 27;
  if (threasholdPassed(startBand, endBand, 3)) {
    hiHatEnv.start();
    colorEnv.start();
  }
  
  startBand = 23;
  endBand = 25;
  if (threasholdPassed(startBand, endBand, 1.6)) {
    snareEnv.start();
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


boolean avgThreasholdPassed(int startBand, int len, float threashold) {
  float avgSum = 0;
  for (int i = startBand; i < len; i++) {  
    avgSum = (avgSum + fftLog.getAvg(i)/i);
  }
  if (avgSum > threashold) {
     return true;
  }
  return false;
}