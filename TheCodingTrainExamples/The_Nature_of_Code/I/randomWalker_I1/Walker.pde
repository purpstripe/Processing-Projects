class Walker {
  int x, y;
  
  Walker(int xPos, int yPos) {
    x = xPos;
    y = yPos;
  }

  void update() {
    float rand = random(1);
    if (rand < .25) {
      x += 15;
    } else if (rand < .50) {
      x -= 15;
    } else if (rand < .75) {
      y += 15;
    } else {
      y -= 15;
    }

    x = constrain(x, 0, width - 1);
    y = constrain(y, 0, height - 1);
  }

  void display() {
    smooth();
    noFill();
    stroke(255,255,255);
    strokeWeight(2);
    ellipse (x, y, 30, 30);
  }
}