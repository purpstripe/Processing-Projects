import processing.video.*;

Capture video;

void setup() {
  size (1000, 800);
  // video = new Capture(this sketch, w, h, ); optional: framerate);
  video = new Capture(this, 1280, 960);
  video.start();
}

void mousePressed() {
  video.read();
}

void captureEvent(Capture video) {
    
}

void draw() {
  background(0);
  
  tint (255, 255 - mouseX/4, 255 - mouseY/4);
  image(video, 0, 0, mouseX, mouseY);
}