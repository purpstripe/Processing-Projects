class Bubble {
   
// data
float x;
float y;
float velX;
float velY;
int rad;
int col;
  
  // constructor!!
  Bubble() {
    x = width/2;
    y = height * 2/3;
    rad = 32;
    col = 127;
    velX = random(-5,5);
    velY = random(-3,3);
  }
  
  // functionality
  void display() {
    stroke(0);
    fill(col);
    ellipseMode(RADIUS);
    ellipse(x, y, rad, rad);
  }
  void update() {
    y += velY;
    x += velX;
  }
  
  void colChange() {
    col = mouseY;
  }
  
  void bounce() {
    if (x > width - rad) {
      x = width - rad;
      velX *= -1;
    }
    if (x < rad) {
      x = rad;
      velX *= -1;
    }
    if (y > height - rad) {
      y = height - rad;
      velY *= -1;
    }
    if (y < rad) {
      y = rad;
      velY *= -1;
    }
  }
}