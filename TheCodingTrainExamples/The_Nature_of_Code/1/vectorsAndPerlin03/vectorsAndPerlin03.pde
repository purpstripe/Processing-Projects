float rand1, rand2;
float t;
Ball ball;


void setup() {
  size(600,600);

  rand1 = 0; // initial values for the constructor
  rand2 = 5;  
  ball = new Ball();
}

void draw() {
  background(100);
  
  t += .01; // changing time by step .01
  
  /* the noise fn is time dependent; therefore, if I seed both noise fns with the same
  value (t), then the outputs of those fns will be the same */
  
  float accVecX = 0;
  float accVecY = noise(t); // getting values of perlin noise for the acc with different seed
  if(mousePressed) {
    accVecX = noise(t + 5);
    accVecX = map(accVecX,0,1,-1,1);
  }
  else {
    accVecX = 0;
  }
  
  accVecY = map(accVecY,0,1,0,1.2); // mapping the values of the acc components 
  
  
  PVector accVec = new PVector(accVecX, accVecY); // defining an acc vector with those components
  
  ball.vel.add(accVec); // adding this changing vector to the current one
  
  ball.update();
  ball.bounce();
  ball.display();
}
