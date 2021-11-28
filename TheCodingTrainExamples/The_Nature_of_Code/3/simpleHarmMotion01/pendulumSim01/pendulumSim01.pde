PVector origin;
PVector bob;
float len;
float rad;

float ang;
float aVel;
float aAcc;


void setup() {
  size(700, 700);
  
  len = 300;
  rad = 50;
  
  ang = PI/4;
  
  origin = new PVector(width/2, 0);
  bob = new PVector(width/2, len);
}

void draw() { 
  background(255);
  
  
  // updating values for bob
  bob.x = origin.x + len*sin(ang);
  bob.y = origin.y + len*cos(ang);
  
  
  fill(0);
  stroke(1);
  line(origin.x, origin.y, bob.x, bob.y);
  ellipseMode(RADIUS);
  ellipse(bob.x, bob.y, rad, rad);
  
  aAcc = -1 * 3/len * sin(ang); // flip the y upwards
  
  ang += aVel;
  aVel += aAcc;
  
  aVel *= 0.98;
}
