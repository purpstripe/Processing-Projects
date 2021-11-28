// displays vector triangle

void setup() {
  size(500,300);
}

void draw() {
  background(255);
  strokeWeight(2);
  stroke(0);
  noFill();
  
  ellipse(width/2,height/2,3,3); // draws an ellipse at (0,0)
  
  PVector mouse = new PVector(mouseX,mouseY); // vector with the mouse coordinates  //<>//
  PVector center = new PVector(width/2,height/2); // vector with the center coordinates
  
  line(0,0,width/2,height/2);
  line(0,0,mouse.x,mouse.y);
  line(center.x,center.y,mouse.x,mouse.y); // displays said distance as a line
}