/*
  if you define an object that is the same as a class
 the class describes a way to construct the object (how to make snowflakes)
 
 class instance
 particular iteration of a snowflake
 
 an object has both data and functionality
 */

int col;

Bubble bubble;

void setup() {
  size(640, 360);

  // Bubble object b constructed by the constructor in class, Bubble
  bubble = new Bubble();
}

void draw() {
  background(255);

  // functions defined in class "b." refers to the function for the object b
  bubble.display();
  bubble.ascend();
  bubble.top();
}

void mousePressed() {
  //col = mouseY;
  //bubble.fill(col);
}