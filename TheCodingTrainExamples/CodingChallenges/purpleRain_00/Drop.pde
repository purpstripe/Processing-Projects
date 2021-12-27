class Drop {
  float x = random(width);
  float y = random(-500, -100);
  float yspeed = random(4, 10);
  
  void fall() {
    y = y + yspeed;
  }
  
  void show() {
    stroke(138, 43, 266);
    line(x,y,x,y+10);
  }
}
