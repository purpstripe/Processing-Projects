float rand;

void setup() {
  size(400,400);

}

void draw() {
  background(255);
  
  rand = randomGaussian(); //<>//
  
  // standard deviation editing of rand
    // horizontal dialation (the standard distance that random values deviate from the mean)
      // rand *= stddev;
  // mean editing of rand
    // translating the graph to new mean
      // rand = rand + mean;
  
  rand *= 10;
  rand += 100;
  
  fill(0);
  ellipse(width/2, height/2, rand, rand);
}