// subclass, SquareParticle, inherits from Particle class
class SquareParticle extends Particle {

  SquareParticle(PVector loc) {
    super(loc);
  }
  
  void display() {
    fill(123, lifeSpan);
    stroke(0, lifeSpan);
    rectMode(CENTER);
    rect(pos.x, pos.y, 20, 20);
  }
}
