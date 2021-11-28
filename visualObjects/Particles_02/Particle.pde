class Particle {
  // data
  PVector pos;
  PVector vel;
  PVector accel;
  float rad;
  int fillColor;
  float xMin, xMax, yMin, yMax;
  int age;
  int lifeSpan;
  boolean dead;
  float maxRad;
  float angle;
  float velMag;
  

  Particle(float x, float y, float velMag, float angle) {
    pos = new PVector(x,y);
    vel = new PVector(velMag * cos(angle), velMag * sin(angle));
    maxRad = 5;
    fillColor = 0xFFFFFFFF;
    xMin =  0;
    xMax = width;
    yMin = 0;
    yMax = height;
    age = 0;
    dead = false;
    lifeSpan = 400;
    accel = new PVector(0, 0.1);
  }

  float radFunction(int t) {
    float param = (float) t / lifeSpan;
    return maxRad*(1-param);
  }

  void updateMe() {
    age++;
    if (age > lifeSpan) {
      dead = true;
    } else {
      rad = radFunction(age);
    }
    vel.add(accel);
    pos.add(vel);
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
  void drawMe() {
    fill(fillColor);
    noStroke();
    ellipseMode(RADIUS);
    ellipse(pos.x, pos.y, rad, rad);
  }
}


// when looping through arraylist and potentially removing object then loop through backwards