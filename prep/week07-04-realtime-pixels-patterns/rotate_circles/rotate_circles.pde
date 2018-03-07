void setup() {
  size(640, 640);
  noStroke();
}

void draw() {
  background(20);
  float amp = 45;
  translate(width/2, height/2);
  for (int i = 0; i < 360; i += 60) {
    for (int j = 0; j < 360; j += 10) {
      float x = sin(radians(i-frameCount))*amp + sin(radians(j))*amp*1.5;
      float y = cos(radians(i-frameCount))*amp + cos(radians(j))*amp*1.5;
      float size = sin(radians(j-i-frameCount*2))*5;    
      if (size < 1) size = 1;
      ellipse(x, y, size, size);
    }
  }
}