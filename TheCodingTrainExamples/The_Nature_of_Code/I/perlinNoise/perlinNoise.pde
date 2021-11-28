float t = 0;

void setup() {
  size(600,400);
}

void draw() {
  background(0);
  fill(255);
 
 t = t + .01; // changing time by step .01
 
 float x = noise(t); // getting values of perlin noise for different points in time
   
 x = map(x,0,1,0,width); // mapping outputs of noise fn from 0 to 1 to 0 to width
 
 ellipse(x,height/2,40,40); // drawing ellipse with noise as x pos
}