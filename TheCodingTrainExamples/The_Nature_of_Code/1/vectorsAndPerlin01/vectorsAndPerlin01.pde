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
  
  float accVecX = noise(t + rand1); // getting values of perlin noise for the acc
  float accVecY = noise(t + rand2); // getting values of perlin noise for the acc with different seed
  
  accVecX = map(accVecX,0,1,-.01,.01); // mapping the values of the acc components 
  accVecY = map(accVecY,0,1,-.01,.01);
  
  PVector accVec = new PVector(accVecX, accVecY); // defining an acc vector with those components
  
  ball.vel.add(accVec); // adding this changing vector to the current one
  
  ball.update();
  ball.bounce();
  ball.display();
}
