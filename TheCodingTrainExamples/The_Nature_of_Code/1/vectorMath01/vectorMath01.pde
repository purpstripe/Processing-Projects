// demonstrates use of vector subtraction and translate

void setup() {
  size(500,300);
}

void draw() {
  background(255);
  strokeWeight(2);
  stroke(0);
  noFill();
  
  translate(width/2,height/2); // moves the point (0,0) to the center for objects
  ellipse(0,0,3,3); // draws an ellipse at (0,0)
  
  PVector mouse = new PVector(mouseX,mouseY); // vector with the mouse coordinates  //<>//
  PVector center = new PVector(width/2,height/2); // vector with the center coordinates
  
  mouse.sub(center); // finds distance between mouse coordinates and center coordinates
  
  line(0,0,mouse.x,mouse.y); // displays said distance as a line
}