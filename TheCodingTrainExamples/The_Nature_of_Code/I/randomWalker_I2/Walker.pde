class Walker {
  int x, y;
  int strokeR, strokeG, strokeB;
  
  Walker(int xPos, int yPos) {
    x = xPos;
    y = yPos;
  }

  void update() {
    float rand = random(1);
    if (rand < .30) {
      y -= 5;
    } else if (rand < .60) {
      x += 5;
    } else if (rand < .90) {
      y += 5;
    } else {
      x -= 5;
    }

    x = constrain(x, 0, width - 1);
    y = constrain(y, 0, height - 1);
  }

  void display() {
    smooth();
    noFill();
    stroke(strokeR, strokeG, strokeB);
    strokeWeight(2);
    ellipse (x, y, 10, 10);
  }

  void changeCol() {
      strokeR += 100;
      strokeG += 60;
      strokeB += 115;
      strokeR %= 255;
      strokeG %= 255;
      strokeB %= 255;
  }
}