class Envelope {
  int decay;
  float value;
  boolean running;
  
  Envelope(int dec) {
    decay = dec;
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
