Envelope radEnv;
Envelope colorEnv;

void setup() {
  size(800,800);
  
  radEnv = new Envelope();
  colorEnv = new Envelope();
}

void draw() {
  radEnv.update();
  colorEnv.update();
  
  int startColor = 0xFFFF0000;
  int endColor = 0xFFFFFF00;
  
  background(0xFFFFFFFF);
  
  float rad = 100 + radEnv.value*(100);
  int col = lerpColor(startColor, endColor, colorEnv.value);
  println(colorEnv.value);
  
  noStroke();
  fill(col);
  ellipse(width/2, height/2, rad, rad);
}
 
void mousePressed() {
  radEnv.start();
  colorEnv.start();
}

class Envelope {
  int decay;
  float value;
  boolean running;
  
  Envelope() {
    decay = 60;
    value = 0;
    running = false;
  }
  
  void start() {
    running = true;
    value = 1;
  }
  
  void update() {
    if (running) {
      value -= 1.0/decay;
      if (value < 0) {
        value = 0;
        running = false;
      }
    }
  }
  
}