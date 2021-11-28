class Mover {
  PVector pos, vel, acc;
  int rad;
  
  Mover() {
    rad = 10;
    pos = new PVector(width/2,height/2);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
  }
  
  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(pos);
    mouse.setMag(0.3); // tweak this val for more fun, or make non const
    acc = mouse;
    
    vel.add(acc);
    pos.add(vel);
    vel.limit(5); // turn on and off for different accels
  }
  
  void edges() {
    if(pos.x > width)    pos.x = 0;
    if(pos.x < 0)        pos.x = width;
    if(pos.y > height)   pos.y = 0;
    if(pos.y < 0)        pos.y = height;
  }
  
  // technically should only do things that effect acc, not pos or vel...
  void bounce() {
    if((pos.x > width - rad) || (pos.x < 0 + rad)) {
      vel.x *= -1;
    }
    if((pos.y > height - rad) || (pos.y < 0 + rad)) {
      vel.y *= -1;
    }
  }
  
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(123);
    ellipseMode(RADIUS);
    ellipse(pos.x,pos.y,rad,rad);
  }
}
