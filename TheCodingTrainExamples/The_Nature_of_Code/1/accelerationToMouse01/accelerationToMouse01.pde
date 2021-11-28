Mover m;
int bgColor;

void setup() {
  size(640, 360);
  bgColor = 255;
  m = new Mover();
}

void draw() {
  background(bgColor);
  m.update();
  // m.edges();
  m.bounce();
  m.display();
}
