class Particle {
  // data
  PVector pos;
  PVector vel;
  PVector accel;
  float rad;
  float fillColorR, fillColorG, fillColorB;
  float velThreashold;
  float xMin, xMax, yMin, yMax;
  //int age;
  //int lifeSpan;
  //boolean dead;
  //float maxRad;
  //float angle;
  //float velMag;
  
/*
  Particle(float x, float y, float velMag, float angle) {
    pos = new PVector(x,y);
    vel = new PVector(velMag * cos(angle), velMag * sin(angle));
    accel = new PVector(0, 0);
    maxRad = 5;
    fillColor = 0xFFFFFFFF;
    xMin =  0;
    xMax = width;
    yMin = 0;
    yMax = height;
    age = 0;
    dead = false;
    lifeSpan = 400;
  }
*/


  Particle(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    rad = 2;
    velThreashold = 20;
    fillColorR = 255;
    fillColorG = 255;
    fillColorB = 255;
    xMin = 0;
    xMax = width;
    yMin = 0;
    yMax = height;
  }

/*
  float radFunction(int t) {
    float param = (float) t / lifeSpan;
    return maxRad*(1-param);
  }
*/

  void update(PVector radialVector, float k, float f) {
    fillColorR = 255 * mag(vel.x, vel.y) / velThreashold;
    fillColorG = 255 * (velThreashold - mag(vel.x, vel.y)) / velThreashold;
    fillColorB = 255;
    //age++;
    //if (age > lifeSpan) {
    //  dead = true;
    //} else {
    //  rad = radFunction(age);
    //}
    accel.x = k / pow(mag(radialVector.x, radialVector.y), 2) * radialVector.x/mag(radialVector.x, radialVector.y);
    accel.y = k / pow(mag(radialVector.x, radialVector.y), 2) * radialVector.y/mag(radialVector.x, radialVector.y);
    vel.add(accel);
    pos.add(vel);
    // maxvel = sqrt(2k/r) - 1, then get rid of wall bouncing  
    if (pos.x < xMin + rad) {
      pos.x = xMin + rad;
      // vel.x *= -1;
      vel.x *= -1 + f;
    }
    if (pos.x > xMax - rad) {
      pos.x = xMax - rad;
      // vel.x *= -1;
      vel.x *= -1 + f;
    }
    if (pos.y < yMin + rad) {
      pos.y = yMin + rad;
      // vel.y *= -1;
      vel.y *= -1 + f;
    }
    if (pos.y > yMax - rad) {
      pos.y = yMax - rad;
      // vel.y *= -1;
      vel.y *= -1 + f;
    }
  }
  
  
  void display() {
    fill(fillColorR, fillColorG, fillColorB);
    noStroke();
    ellipseMode(RADIUS);
    ellipse(pos.x, pos.y, rad, rad);
  }
}


// when looping through arraylist and potentially removing object then loop through backwards
