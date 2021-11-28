import processing.video.*;

Capture video;

void setup() {
  size (600, 400);
  // video = new Capture(this sketch, w, h, ); optional: framerate);
  video = new Capture(this, 1280, 960);
  video.start();
}

void draw() {
  background(0);
  
  if (video.available()) {
    video.read();
  }
  
  tint (255, 255 - mouseX, 255 - mouseY);
  image(video, 0, 0, mouseX, mouseY);
}