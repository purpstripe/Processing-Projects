class Ball {
  PVector pos, vel, acc; // initializing vectors for posistion, velocity, and acceleration
  int rad; // radius of the ball
  
  Ball(){ // constructor for the ball
    pos = new PVector(width/2,height/2);
    vel = new PVector(0,-10); // initial velocity straight up
    acc = new PVector(0, .1); // initial acc down
    rad = 40; // setting the radius of the ball
  }
  void update() {
    pos.add(vel); // adding small velocity vectors to the ball's position vectors
    vel.add(acc); // adding small acceleration to the ball's velocity vector
  }
  
  void bounce() {
    if(pos.x > width) { // making the ball bounce off of the right wall
      pos.x = width;
      vel.x -= .1; // friction
      vel.x *= -1; // changing direction
    }
    if(pos.x < 0) { // making the ball bounce off of the left wall
      pos.x = 0;
      vel.x += .1; // friction
      vel.x *= -1; 
    }
    if (pos.y > height) { // making the ball bounce off of the bottom wall
      pos.y = height;
      vel.y -= .1; // friction
      vel.y *= -1; 
    }
    if(pos.y < 0) { // making the ball bounce off of the top wall
      pos.y = 0;
      vel.y += .1; // friction
      vel.y *= -1;
    }
  }
  
  void display() {
    ellipse(ball.pos.x,ball.pos.y,rad,rad); // drawing the ellipse with the ball data
  }
}