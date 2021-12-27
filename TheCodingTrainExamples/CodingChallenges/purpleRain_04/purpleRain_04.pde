int numDrops = 300;
//Drop[] drops = new Drop[numDrops];
Drop d;

void setup() {
  size(640, 360);
  d = new Drop();
  //for (int i = 0; i < drops.length; i++) {
   // drops[i] = new Drop();
  //}
}

void draw() {
  background(230, 230, 250);
  //for (int i = 0; i < drops.length; i++) {
  //  drops[i].fall();
  //  drops[i].show();
  //}
  d.fall();
  d.show();
}
