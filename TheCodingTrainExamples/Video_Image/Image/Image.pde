PImage frog;

void setup() {
  size (600, 400);
  frog = loadImage("frog.jpg");
}

void draw() {
  background(0);
  tint (255,mouseX,mouseY);
  image(frog, 0, 0, mouseX, mouseY);
}