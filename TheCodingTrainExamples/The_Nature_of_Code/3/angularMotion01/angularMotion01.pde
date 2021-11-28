float ang = 0.0;
float angVel = 0.0;
float angAcc = 0.001;

void setup() {
  size(600, 300);
}

void draw() {
  background(255);
  
  angAcc = map(mouseX, 0 , width, 0.001, -0.001);
  
  ang += angVel;
  angVel += angAcc;
  
  rectMode(CENTER);
  stroke(0);
  fill(125);
  translate(width/2, height/2);
  rotate(ang);
  rect(0,0, 50, 40);
}
