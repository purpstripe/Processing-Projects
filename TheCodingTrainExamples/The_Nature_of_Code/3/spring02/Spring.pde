class Spring {
  PVector anchor;
  float restLen;
  float k;

  Spring(float x, float y, int l) {
    anchor = new PVector(x,y);
    restLen = l;
  }

  void connect(Mover m) {
    // creating a vector that represents the direction of the spring and its length as mag
    PVector spring = PVector.sub(bob.pos, anchor);
    // separating the magnitude of the vector from the direction
    float currentLen = spring.mag();
    // now the spring PVector is a unit vector in the direction opposite the spring force
    spring.normalize();
    float k = 0.1; // spring constant for hooke's
    float displacement = currentLen - restLen;
    spring.mult(-k*displacement);
    m.applyForce(spring);
  }
}
