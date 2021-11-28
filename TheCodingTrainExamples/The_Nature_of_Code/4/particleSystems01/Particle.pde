// mover object
class Particle {
  PVector pos, vel, acc; // position, velocity, and acceleration of a single particle object
  float rad; // radius of particle object
  
  float lifeSpan = 255; // lifespan of the particle used to determine how long that particle is a part of the arraylist before recycling
  
  Particle(PVector start) { // particle object constructor
    acc = new PVector(0, 0.05); // setting the initial acceleration of the particle object, in this case it is similar to a gravity value
    vel = new PVector(random(-1, 1), random(-1, 1)); // initial velocity of particle object
    pos = start.copy(); // using a copy of the value from the argument of the constructor
    rad = 10;
  }
  
  void update() { // update function for the particle to determine its next location on the screen within the data before being displayed
    vel.add(acc);
    pos.add(vel);
    // updating the lifespan of the particle
    lifeSpan -= 2; 
  }
  
  boolean isDead() { // this boolean method determines when the particle is dead, in other words, when the lifespan has run out
    return lifeSpan <= 0;
  }
  //boolean isDead() {
  //  if (lifeSpan <= 0) {
  //    return true;
  //  } else {
  //    return false;
  //  }
  
  void display() { // display function to display the single particle object
    fill(123, lifeSpan); 
    stroke(0, lifeSpan);
    strokeWeight(2);
    ellipseMode(RADIUS);
    ellipse(pos.x, pos.y, rad, rad);
  }
}
