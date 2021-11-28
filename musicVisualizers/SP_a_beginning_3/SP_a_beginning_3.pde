float[] distribution = new float[360];

void setup() {
 size(1000, 800);
 frameRate(30);
 smooth();
 stroke(255);
 for (int i = 0; i < distribution.length; i++) {
    distribution[i] = int(randomGaussian() * 90);
  }
}
      
void draw() {
  
  background(mouseX / 5, mouseY / 5, 25);
  translate(width/2, height/2);

  for (int i = 0; i < distribution.length; i++) {
    rotate(TWO_PI/distribution.length);
    float dist = abs(distribution[i] + random(10));//(millis() % 5));
    line(0, 0, dist, mouseX);
  }
}
     
void mousePressed() {
  float randr = random(256);
  float randg = random(256);
  float randb = random(256);
  stroke(randr, randg, randb);
}