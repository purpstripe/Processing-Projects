class Ball {
  
  PVector pos;
  PVector vel;
  PVector acc;
  float velX, velY;
  int fillColor;
  float rad;
  float xMin, xMax, yMin, yMax;
  float angle;
  float velMax;
  float velMag;

  Ball(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(x, y);
    fillColor = 0xFF991055;
    rad = 10;
    xMin = 0;
    xMax = width;
    yMin = 0;
    yMax = height;
    velMax = 10;
  }
  
  void updateMe() {
    rand1 = random(1);
    rand2 = random(1);
    angle = randomGaussian() * 2 * PI;
    velMag = velMax * rand1;
    vel.x = velMag * cos(angle);
    vel.y = velMag * sin(angle);
    pos.add(vel);
    //vel.add(acc);
    bounce();
  }
  
  void drawMe(){
    fill(fillColor);
    ellipseMode(RADIUS);
    ellipse (pos.x, pos.y, rad, rad);
  }

  void bounce() {
    if (pos.x < xMin + rad) {
      pos.x = xMin + rad;
      vel.x *= -1;
    }
    if (pos.x > xMax - rad) {
      pos.x = xMax - rad;
      vel.x *= -1;
    }
    if (pos.y < yMin + rad) {
      pos.y = yMin + rad;
      vel.y *= -1;
    }
    if (pos.y > yMax - rad) {
      pos.y = yMax - rad;
      vel.y *= -1;
    }
  }
}