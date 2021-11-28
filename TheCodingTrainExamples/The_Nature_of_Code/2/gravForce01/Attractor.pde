class Attractor {
  PVector pos;
  int rad, mass, G;
  
  
  Attractor() {
    pos = new PVector(width/2, height/2);
    mass = 15;
    G = 1;
    rad = mass * 2;
  }

  void hover() {
    pos.set(mouseX, mouseY);
  }
  
  PVector attract(Mover m){
    // direction of force
    PVector force = PVector.sub(pos, m.pos);
    float d = force.mag();
    
    d = constrain(d, 5, 25); // keeps this distance value between these numbers for looks
    
    force.normalize();
    
    // magnitude of force
    float strength = (G * mass * m.mass) / (d * d);
    
    // putting mag and dir together
    force.mult(strength);
    
    return force;
  }
  
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(123);
    ellipseMode(RADIUS);
    ellipse(pos.x, pos.y, rad, rad);
  }
  
}
