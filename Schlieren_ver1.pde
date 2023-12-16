import processing.video.*;
import com.hamoid.*;

Capture video;
PImage firstFrame;
VideoExport videoExport;

boolean grayMode = true, blurMode = true, record = false, start = true;
String datetime = str(year())+str(month())+str(day())+str(hour())+str(minute())+str(second());

void setup() {
  size(640, 480);
  frameRate(240);
  video = new Capture(this, width, height);
  video.start();
  surface.setVisible(true);
}

void captureEvent(Capture video) {
  video.read();
  if (firstFrame == null) firstFrame = video.get();
}

void draw() {
  if (video.available()) {
    if (firstFrame != null) {
      video.read();
      PImage currentFrame = video.get();

      currentFrame.loadPixels();
      firstFrame.loadPixels();

      for (int i = 0; i < currentFrame.pixels.length; i++) {
        int currentPixel = currentFrame.pixels[i];
        int firstPixel = firstFrame.pixels[i];

        int r = (currentPixel >> 16 & 0xFF) - (firstPixel >> 16 & 0xFF);
        int g = (currentPixel >> 8 & 0xFF)- (firstPixel >> 8 & 0xFF);
        int b = (currentPixel & 0xFF)- (firstPixel & 0xFF);

        currentFrame.pixels[i] = color(r, g, b);
      }

      currentFrame.updatePixels();
      image(currentFrame, 0, 0);
      if (grayMode) filter(GRAY);
      if (blurMode) filter(BLUR, 3);

      if (record) videoExport.saveFrame();
    }
  }
}


void keyPressed() {
  if (key == 'r' || key == 'R') {
    record = !record;
    if (record) println("RECORDING STARTED");
    else println("RECORDING PAUSED");
    if (start) {
      videoExport = new VideoExport(this, "FS" + datetime + ".mp4");
      videoExport.startMovie();
      start = false;
    }
    if (key == ESC) {
      println("VIDEO SAVED");
      videoExport.endMovie();  
      exit();
    }
  }

  if (key == 's' || key == 'S') {
    String name = datetime + random(1000) + ".png";
    save(name);
    println("SCREENSHOT SAVED");
  }
  if (key == 'g' || key == 'G') {
    grayMode = !grayMode;
    if (grayMode) println("GRAY MODE ON");
    else println("GRAY MODE OFF");
  }
  if (key == 'b' || key == 'B') {
    blurMode = !blurMode;
    if (blurMode) println("BLUR MODE ON");
    else println("BLUR MODE OFF");
  }
}
