/*
  if you define an object that is the same as a class
 the class describes a way to construct the object (how to make snowflakes)
 
 class instance
 particular iteration of a snowflake
 
 an object has both data and functionality
 */

Bubble bubble;

void setup() {
  size(640, 360);

  // Bubble object b constructed by the constructor in class, Bubble
  bubble = new Bubble();
}

void draw() {
  background(255);

  // functions defined in class "Bubble." refers to the function for the object bubble
  bubble.update();
  bubble.bounce();
  bubble.display();
  
  for (int i = 0; i < height; i++) {
    stroke(i);
    line (0, i, 50, i);
  }
}

void mousePressed() {
  bubble.colChange();
}