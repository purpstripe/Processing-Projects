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
