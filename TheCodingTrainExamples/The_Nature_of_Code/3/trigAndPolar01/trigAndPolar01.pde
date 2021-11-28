float inc = 0.01;
float t = 0;
float r;
float a = 0.0;
float aVel = 0.0;
float aAcc = 0.001;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
 
  translate(width/2, height/2);
  
  t += inc;
  r = noise(t);
  r = map(r, 0, 1, 100, width);
  
  float x = r * cos(a);
  float y = r * sin(a);
  // implimenting perlin noise to determine the radius
  
  fill(255);
  stroke(255);
  line(0, 0, x, y);
  ellipse(x, y, 50, 50);
  
  a += aVel;
  aVel += aAcc;
  aVel = constrain(aVel, 0, 0.1);
}
