//import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.effects.*;
//import ddf.minim.signals.*;
//import ddf.minim.spi.*;
//import ddf.minim.ugens.*;

 import processing.sound.*;
//import ddf.minim.*;

// Declare the sound source and FFT analyzer variables
//Minim minim;
//AudioPlayer song;
FFT fft;

SoundFile sample;
//AudioIn in;

// Define how many FFT bands to use (this needs to be a power of two)
int bands = 512;
// Create a vector to store the smoothed spectrum data in
float[] sum = new float[bands];
// Define a smoothing factor which determines how much the spectrums of consecutive
// points in time should be combined to create a smoother visualisation of the spectrum.
// A smoothing factor of 1.0 means no smoothing (only the data from the newest analysis
// is rendered), decrease the factor down towards 0.0 to have the visualisation update
// more slowly, which is easier on the eye.
float smoothingFactor = 0.2;
// Variables for drawing the spectrum:
// Declare a scaling factor for adjusting the height of the rectangles
int scale = 5;
// Declare a drawing variable for calculating the width of the
float barWidth;
int startBand;
int endBand;

float radius;
int centX;
int centY;
float x, y;
float randX;
float xnoise;
float randY;
float ynoise;
float noiseScale;
float noiseStep;
Envelope radEnv;
Envelope colorEnv;
color startColor;
color endColor;
float songDuration;
int totalFrames;

void setup() {
  size(1024, 720);
  background(0);
  // Calculate the width of the rects depending on how many bands we have
  barWidth = width/float(bands);
  
  // Load and play a soundfile and loop it.
  sample = new SoundFile(this, "avery.wav");
  sample.play();
  // sample.loop();
  
  // minim = new Minim(this);
  // song = minim.loadFile("avery.wav");
  // song.play();
  // Create FFT object using the same buffer size and sample rate
  // fft = new FFT(song.bufferSize(), song.sampleRate());
  
  int fps = 60;
  frameRate(fps);
  // three minutes and six seconds
  // songDuration = song.length() / 1000.0;
  // total frames of the song to match with song duration (at 60fps)
  // totalFrames = int(songDuration * fps);
  // println("Duration: " + songDuration + " sec (" + totalFrames + " frames)");

  // Create the FFT analyzer and connect the playing soundfile or mic to it.
   fft = new FFT(this, bands);
  //in = new AudioIn(this, 0);

  // start the Audio Input
  //in.start();

  // patch the AudioIn
  //fft.input(in);
  
  // connect the playing soundfile
   fft.input(sample);

  radEnv = new Envelope();
  colorEnv = new Envelope();

  radius = 200;
  centX = width/2;
  centY = height/2;
  xnoise = random(1);
  ynoise = random(1);
  noiseScale = radius / 2;
  noiseStep = 0.5;

  strokeWeight(5);
  smooth();
  noFill();
  startColor = color(255, 255, 255);
  endColor = color(255, 255, 255);
}

void draw() {
  background(0);
  
  // float t = (float)frameCount / totalFrames;
  // float timeSec = t * songDuration;
  
   fft.analyze();
  //fft.forward(song.mix);
  //for (int i = 0; i < fft.specSize(); i++) {
  //  float x = map(i, 0, fft.specSize(), 0, width);
  //  float h = fft.getBand(i) * 8;
  //  line(x, height, x, height - h);
  //}
  for (int i = 0; i < bands; i++) {
    // Smooth the FFT spectrum data by smoothing factor
    sum[i] += (fft.spectrum[i] - sum[i]) * smoothingFactor;

    // Draw the rectangles, adjust their height using the scale factor
    rect(i*barWidth, height, barWidth, -sum[i]*height*scale);
  }

  colorEnv.update();
  int col = lerpColor(startColor, endColor, colorEnv.value);
  stroke(col);
  ellipse(centX, centY, radius*2, radius*2);

  radEnv.update();  

  for (float ang = 0; ang < 360; ang += 5) {
    float rad = radians(ang);
    xnoise = xnoise + noiseStep;
    //randX = noise(xnoise) * 10 + (radEnv.value * noise(xnoise) * 40);
    randX = radEnv.value * noise(xnoise) * noiseScale;
    ynoise = ynoise + noiseStep;
    //randY = noise(ynoise) * 10 + (radEnv.value * noise(ynoise) * 40);
    randY = radEnv.value * noise(ynoise) * noiseScale;
    x = centX + ( (radius+randX) * cos(rad));
    y = centY + ( (radius+randY) * sin(rad));
    point(x, y);
  }
  
  startBand = 0;
  endBand = 7;
  if (sumThreasholdPassed(startBand, endBand, 0.80)) {
    radEnv.start();
    colorEnv.start();
    endColor = color(random(255), random(255), random(255));
  }
  
  //saveFrame("frames/frame-####.png");
  
  //if (frameCount >= totalFrames) {
  //  exit();
  //}
}

//void mousePressed() {
//  radEnv.start();
//  colorEnv.start();
//  endColor = color(random(255), random(255), random(255));
//}





boolean threasholdPassed(int startBand, int len, float threashold) {
  for (int i = startBand; i < len; i++) {  
    if (fft.spectrum[i] > threashold) {
     return true;
     }
  }
  return false;
}


boolean sumThreasholdPassed(int startBand, int len, float threashold) {
  float sum = 0;
  for (int i = startBand; i < len; i++) {  
    sum = sum + fft.spectrum[i];
  }
  if (sum > threashold) {
     return true;
  }
  return false;
}


//boolean avgThreasholdPassed(int startBand, int len, float threashold) {
//  float avgSum = 0;
//  for (int i = startBand; i < len; i++) {  
//    avgSum = (avgSum + fftLog.getAvg(i)/i);
//  }
//  if (avgSum > threashold) {
//     return true;
//  }
//  return false;
//}
