import ddf.minim.*;
import ddf.minim.analysis.*;

// import processing.sound.*;

// Declare the sound source and FFT analyzer variables
Minim minim;
AudioPlayer song;
FFT fft;
//BeatDetect beat;
//BeatListener bl;

// for processing.sound
//SoundFile sample;
//AudioIn in;

// Define how many FFT bands to use (this needs to be a power of two)
// int bands = 512;
// Create a vector to store the smoothed spectrum data in
// float[] sum = new float[bands];
// Define a smoothing factor which determines how much the spectrums of consecutive
// points in time should be combined to create a smoother visualisation of the spectrum.
// A smoothing factor of 1.0 means no smoothing (only the data from the newest analysis
// is rendered), decrease the factor down towards 0.0 to have the visualisation update
// more slowly, which is easier on the eye.
// float smoothingFactor = 0.2;
// Variables for drawing the spectrum:
// Declare a scaling factor for adjusting the height of the rectangles
// int scale = 5;
// Declare a drawing variable for calculating the width of the
//float barWidth;
//int startBand;
//int endBand;

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
Envelope dotEnv;
Envelope colorEnv;
Envelope fillEnv;
color startColor;
color endColor;
float songDuration;
int totalFrames;

float bass;
float snare;
float smoothing = 0.8;
float[] smoothed;


void setup() {
  size(1024, 720);
  background(0);
  // Calculate the width of the rects depending on how many bands we have
  // barWidth = width/float(bands);
  
  // Load and play a soundfile and loop it with processing.sound
  //sample = new SoundFile(this, "avery.wav");
  //sample.play();
  // sample.loop();
  
  // using minim
  minim = new Minim(this);
  // samples per analysis frame — determines FFT resolution and playback smoothness
  int bufferSize = 1024;
  // Return an AudioPlayer object, called song
  song = minim.loadFile("avery.wav", bufferSize);
  song.play();
  
  // Create FFT object using the same buffer size and sample rate as the song
  fft = new FFT(song.bufferSize(), song.sampleRate());
  // tells Minim to regroup those FFT bins into logarithmic averages — more meaningful, ear-like frequency bands
  int startingFreq = 60;
  int bandsPerOctave = 7;
  fft.logAverages(startingFreq, bandsPerOctave);
  // array with one element per averaged frequency band in your FFT
  // stores a time-smoothed version of fft.getAvg(i), so your bars don’t jitter
  smoothed = new float[fft.avgSize()];
  
  // beat detector for the different instrument threasholds
  // if (beat.isKick())
  // if (beat.isSnare())
  // if (beat.isHat())
  //beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  //beat.detectMode(BeatDetect.FREQ_ENERGY);
  // BeatListener helps sync detection with the audio stream
  // bl = new BeatListener(beat, song);
  
  // setting frames per second
  int fps = 60;
  frameRate(fps);
  // using minim to get total frames for the animation fo this song
  // converting out of milliseconds
  songDuration = song.length() / 1000.0;
  // total frames of the song to match with song duration (at 60fps)
  totalFrames = int(songDuration * fps);
  println("Duration: " + songDuration + " sec (" + totalFrames + " frames)");

  // Create the FFT analyzer and connect the playing soundfile or mic to it.
  // for processing.sound approach
  // fft = new FFT(this, bands);
  // connect the playing soundfile
  // fft.input(sample);
  
  // for audio from the mic
  //in = new AudioIn(this, 0);
  // start the Audio Input
  //in.start();
  // patch the AudioIn
  //fft.input(in);
  
  // envelop objects controlling the radius of the dots and the color of elements
  dotEnv = new Envelope();
  colorEnv = new Envelope();
  fillEnv = new Envelope();

  // initial radius
  radius = 200;
  // centering the cicle
  centX = width/2;
  centY = height/2;
  // noise for the dots
  xnoise = random(1);
  ynoise = random(1);
  // scaling the noise
  noiseScale = radius / 2;
  noiseStep = 0.5;

  // stroke for all the visual elements
  strokeWeight(5);
  smooth();
  noFill();
  // starting and ending color for the elements
  startColor = color(255, 255, 255);
  endColor = color(255, 255, 255);   // ending color is random and used when the bass hits
}

void draw() {
  background(0);
  
  // timing for temporal based animation with frames
  // float t = (float)frameCount / totalFrames;
  // float timeSec = t * songDuration;
  
  // getting the FFT analysis with processing.sound approach
  // fft.analyze();
  //for (int i = 0; i < bands; i++) {
  //  // Smooth the FFT spectrum data by smoothing factor
  //  sum[i] += (fft.spectrum[i] - sum[i]) * smoothingFactor;
  //  // Draw the rectangles, adjust their height using the scale factor
  //  rect(i*barWidth, height, barWidth, -sum[i]*height*scale);
  //}
  
  // updating the color every draw loop
  colorEnv.update();
  int col = lerpColor(startColor, endColor, colorEnv.value);
  stroke(col);
  
  fillEnv.update();
  float fillAlpha = lerp(0, 255, fillEnv.value);
  fill(col, fillAlpha);
  
  // getting FFT analysis with Minim approach
  fft.forward(song.mix);
  // displaying log scaled frequency bars that have been smoothed in animation
  int barHeightScaling = 3;
  for (int i = 0; i < fft.avgSize(); i++) {
    smoothed[i] = lerp(smoothed[i], fft.getAvg(i), 1 - smoothing);
    float x = map(i, 0, fft.avgSize(), 0, width);
    float h = smoothed[i] * barHeightScaling;
    rect(x, height - h, width/fft.avgSize(), h);
  }
  //for (int i = 0; i < fft.specSize(); i++) {
  //  float x = map(i, 0, fft.specSize(), 0, width);
  //  float h = fft.getBand(i) * 8;
  //  line(x, height, x, height - h);
  //}
  
  // drawing our static ellipse
  ellipse(centX, centY, radius*2, radius*2);

  // updating the position of the dancey dots
  dotEnv.update();  

  // drawing all of the dancey dots
  // 360 degrees with a step of 5
  for (float ang = 0; ang < 360; ang += 5) {
    float rad = radians(ang);
    xnoise = xnoise + noiseStep;
    //randX = noise(xnoise) * 10 + (dotEnv.value * noise(xnoise) * 40);
    randX = dotEnv.value * noise(xnoise) * noiseScale;
    ynoise = ynoise + noiseStep;
    //randY = noise(ynoise) * 10 + (dotEnv.value * noise(ynoise) * 40);
    randY = dotEnv.value * noise(ynoise) * noiseScale;
    x = centX + ( (radius+randX) * cos(rad));
    y = centY + ( (radius+randY) * sin(rad));
    point(x, y);
  }
    
  // bass frequency threshold for animation reaction
  // 20Hz to 150Hz
  bass = fft.calcAvg(20,150);
  if (bass > 45) {
    dotEnv.start();
    colorEnv.start();
    endColor = color(random(255), random(255), random(255));
  }
  
  // snare scale increases snare value to find an easier threashold
  int snareScale = 2;
  snare = fft.calcAvg(2500, 3500) * snareScale;
  println(snare);
  if (snare > 7.5) {
    fillEnv.start();
  }
  
  // using beat listener instead
  //if (beat.isKick()) {
  //  dotEnv.start();
  //  colorEnv.start();
  //  endColor = color(random(255), random(255), random(255));
  //}
  
  //startBand = 0;
  //endBand = 7;
  //if (sumThreasholdPassed(startBand, endBand, 0.80)) {
  //  dotEnv.start();
  //  colorEnv.start();
  //  endColor = color(random(255), random(255), random(255));
  //}
  
  // saving frames for turning the animation into video
  //saveFrame("frames/frame-####.png");
  //// exit animation at the end of the song
  //if (frameCount >= totalFrames) {
  //  exit();
  //}
}


// mouse pressed test

//void mousePressed() {
//  dotEnv.start();
//  colorEnv.start();
//  endColor = color(random(255), random(255), random(255));
//}


// Custom threashold functions

//boolean threasholdPassed(int startBand, int len, float threashold) {
//  for (int i = startBand; i < len; i++) {  
//    if (fft.spectrum[i] > threashold) {
//     return true;
//     }
//  }
//  return false;
//}


//boolean sumThreasholdPassed(int startBand, int len, float threashold) {
//  float sum = 0;
//  for (int i = startBand; i < len; i++) {  
//    sum = sum + fft.spectrum[i];
//  }
//  if (sum > threashold) {
//     return true;
//  }
//  return false;
//}

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
