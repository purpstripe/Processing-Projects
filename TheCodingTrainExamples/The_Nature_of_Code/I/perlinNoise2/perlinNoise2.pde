float inc = 0.01;
float t1 = 0;
float t2 = 0 + random(1);
float x, y;

void setup() {
  size(600,400);
}

void draw() {
  background(0);
  fill(255);
  
  t1 += inc;
  t2 += inc;
  
  x = noise(t1); // getting values of perlin noise for different points in time
  y = noise(t2);
  
  x = map(x,0,1,0,width); // mapping outputs of noise fn from 0 to 1 to 0 to width
  y = map(y,0,1,0,height);
  
  ellipse(x,y,40,40); // drawing ellipse with noise as x pos
}
