float a = 0;
Box b;

ArrayList<Box> sponge;
void setup() {
  size(400,400, P3D);
  b = new Box(0, 0, 0, 200);
}

void draw() {
  background(51);
  stroke(255);
  noFill();
  
  translate(width/2, height/2);
  rotateX(a);
  for (Box b : sponge) {
    b.show();
  }
   
  a += 0.01;
}
