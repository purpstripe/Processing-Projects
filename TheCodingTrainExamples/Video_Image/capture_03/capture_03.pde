import processing.video.*;

Capture video;

void setup() {
  size (600, 400);
  // video = new Capture(this sketch, w, h, ); optional: framerate);
  video = new Capture(this, 640, 480);
  video.start();
}

void captureEvent(Capture video) {
    video.read();
}

void draw() {
  background(0);
  
  // tint (255, 255 - mouseX, 255 - mouseY);
  image(video, 0, 0); // , mouseX, mouseY);
}