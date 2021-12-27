class Drop {
  float x = random(width);
  float y = random(-700, -50);
  float z = random(0, 20);
  float len = map(z, 0, 20, 10, 20);
  float yspeed = map(z, 0, 20, 1, 20);
  
  void fall() {
    y = y + yspeed;
    //float grav = map(z, 0, 20, 0, 0.2);
    //yspeed = yspeed + grav;
    
    if (y > height) {
      int numParticles = int(random(2,7));
      Particle[] pArray = new Particle[numParticles];
      for (
      for (Particle p : pArray) {
        p.update();
        p.display();
      }
      y = random(-500, -100);
      yspeed = random(4, 10);
    }
  }
  
  void show() {
    float thick = map(z, 0, 20, 0.5, 4);
    strokeWeight(thick);
    stroke(138, 43, 266);
    line(x,y,x,y+10);
  }
}
