float r1, r2, rand;
float[] vals;

void setup() {
  size(500, 500); 
  /* array to count the number of times an number is picked
  that picked number is used to determine the index */
  vals = new float[width];
}

void draw() {
  background(100);
  rand = customRandom(); // picking a random number based off of custom distribution
  update();
  display();
}

void update() { // updating the values in the array
  int index = int(rand*width); // indexing the random numbers chosen in the array
  vals[index]++;
}

void display() {
  stroke(255);
  for(int x = 0; x < vals.length; x++) { // drawing lines for the values chosen
    line(x,height,x,height-vals[x]);
  }
}

float customRandom() {
  boolean done = false; // true if found number
  int kill = 0; // to stop infinite loops
  while(!done && kill < 10000) {
    r1 = random(1);
    r2 = random(1);
    float y = r1 * r1; // custom function for the values to follow
    if(r2 < y) {
      done = true;
      return r1;
    }
    kill++;
  }
  return 0;
}