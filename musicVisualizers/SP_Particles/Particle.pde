class Particle {
  // data
  PVector pos;
  PVector vel;
  PVector accel;
  float rad;
  int fillColor1;
  int fillColor2;
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
    fillColor1 = 0x4ff3ff99;
    fillColor2 = 0x4f57dcf9;
    xMin =  -width/2;;
    xMax = width/2;
    yMin = -height/2;
    yMax = height/2;
    age = 0;
    dead = false;
    lifeSpan = 138;
    accel = new PVector(0, 0);
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
    float rand = random(2);
    if (rand > 1) {
      fill(fillColor1);
    } else {
      fill(fillColor2);
    }
    noStroke();
    ellipseMode(RADIUS);
    ellipse(pos.x, pos.y, rad, rad);
  }
}