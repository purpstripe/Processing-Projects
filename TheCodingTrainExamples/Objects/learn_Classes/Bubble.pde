class Bubble {
   
   // data
   float x;
   float y;
  
  // constructor!!
  Bubble() {
    x = width/2;
    y = height;
    col = 127;
  }
  
  // functionality
  void display() {
    stroke(0);
    fill(col);
    ellipse(x, y, 64, 64);
  }
  void ascend() {
    y--;
  }
  void top() {
    if (y > 32) {
      y = 32;
    }
  }
}