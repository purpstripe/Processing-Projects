// data
int bgColor;
Body sun;

void setup() {
  size(1000, 1000);
  bgColor = 0;
  sun = new Body(80, 0, 0);
  sun.spawnChildren(1, 1);
  background(bgColor);
}

void draw() {
  translate(width/2, height/2);
  sun.display();
  sun.orbit();
  sun.colorChange();
}
