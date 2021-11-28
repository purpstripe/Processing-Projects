int rand;
float[] array;
int c, arrayCount;
int fillColor1, fillColor2;

void setup() {
  size(800, 50);
  fillColor1 = 200;
  fillColor2 = 50;
  arrayCount= 5;
  array = new float[arrayCount];
  for (int i = 0; i < arrayCount; i++) {
    array[i] = random(1);
  }
}

void draw() {
  //choosing the color of the circles
  rand = (int) random(arrayCount);
    if (array[rand] < .5) {
    fill(fillColor1);
    }
    else {
    fill(fillColor2);
    }
  ellipse(c, height/2, 10, 10);
  c += 10;
}