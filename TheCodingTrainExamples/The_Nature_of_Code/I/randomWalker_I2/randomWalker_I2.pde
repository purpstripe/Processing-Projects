Walker walk;
int bgColor;
//int[] strke = new int[3];

void setup() {
  size(500,500);
  int randX = int(random(0, width)), randY = int(random(0, height));
  walk = new Walker(randX, randY);
  bgColor = 0;
  background(bgColor);
}

void draw() {
  walk.update();
  walk.changeCol();
  walk.display();
}