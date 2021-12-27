Envelope env;

void setup() {
  size(800,800);
  
  env = new Envelope();
}

void draw() {
  env.update();
  
  background(0xFFFFFFFF);
  
  float rad = env.value*200;
  fill(0xFF0080FF);
  ellipse(width/2, height/2, rad, rad);
}
 
void mousePressed() {
  env.start(); 
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
