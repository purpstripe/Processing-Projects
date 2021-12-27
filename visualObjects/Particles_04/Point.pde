class Point {
  // data
  PVector pos;
  
  
  Point(float x, float y) {
    pos = new PVector(x, y);
  }
  
  void display() {
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, 5, 5);
  }
}
