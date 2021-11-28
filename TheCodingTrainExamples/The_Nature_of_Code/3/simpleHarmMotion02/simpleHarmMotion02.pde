float amp = 0;
float a = 0;

void setup() {
  size(640, 360);
  amp = width/2;
}

void draw() {
  background(255);
  translate(width/2, height/2);
  
  float x = amp * sin(a);
  fill(127);
  stroke(0);
  line(0,0,x,0);
  ellipse(x, 0, 50, 50);
  
  a += 0.05;
}
