PVector origin;
Mover bob;
float restLength;

void setup() {
  size(700,700);
  restLength = 200;
  origin = new PVector(width/2, 0);
  bob = new Mover(width/2, restLength);
}

void draw() {
  background(255);
  
  line(origin.x, origin.y, bob.pos.x, bob.pos.y);

  // creating a vector that represents the direction of the spring and its length as mag
  PVector spring = PVector.sub(bob.pos, origin);
  // separating the magnitude of the vector from the direction
  float currentLength = spring.mag();
  // now the spring PVector is a unit vector in the direction opposite the spring force
  spring.normalize();
  float k = 0.1; // spring constant for hooke's
  float displacement = currentLength - restLength;
  spring.mult(-k*displacement);
  
  bob.applyForce(spring);

  PVector wind = new PVector(0.1, 0);
  if(mousePressed) {
    bob.applyForce(wind);
  }

  PVector gravity = new PVector(0, 0.1);
  bob.applyForce(gravity);
  

  bob.update();
  bob.display();
}
