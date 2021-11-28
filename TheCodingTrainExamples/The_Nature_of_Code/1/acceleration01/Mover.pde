class Mover {
  PVector pos, vel, acc;
  
  Mover() {
    pos = new PVector(width/2,height/2);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
  }
  
  void update() {
    acc = PVector.random2D(); 
    
    vel.add(acc);
    pos.add(vel);
    vel.limit(5);
  }
  
  void edges() {
    if(pos.x > width)    pos.x = 0;
    if(pos.x < 0)        pos.x = width;
    if(pos.y > height)   pos.y = 0;
    if(pos.y < 0)        pos.y = height;
  }
  
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(123);
    ellipse(pos.x,pos.y,50,50);
  }
}
