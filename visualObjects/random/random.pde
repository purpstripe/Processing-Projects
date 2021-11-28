Ball ball;

float rand1, rand2;

void setup() {
  size(600, 600);
  ball = new Ball(rand1 * width, rand2 * height);
  background(0,0,0);
}

void draw() {
  ball.updateMe();
  ball.drawMe();
}