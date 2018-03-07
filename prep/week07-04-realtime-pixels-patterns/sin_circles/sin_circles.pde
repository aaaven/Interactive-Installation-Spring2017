int count = 20;
float r = 120;
float d = 8.25;
int MAX = 330;

void setup() {
  size(300, 300);
  smooth();
  noStroke();
}

void draw() {
  
  fill(#191970,100);
  rect(0, 0, width, height);
  fill(#ECF0F1, 100);
  
  pushMatrix();
  translate(width / 2, height / 2);
  for (int round = 1; round < count; round++) {
    for (int a = 0; a <= 360; a ++) {
      float progress = constrain(map(frameCount%MAX, 0+round*d, MAX+(round-count)*d, 0, 1), 0, 1);
      float ease = -0.5*(cos(progress * PI) - 1);
      float phase = 2*PI*ease + PI + radians(map(frameCount%MAX, 0, MAX, 0, 360));
      
      float x = map(a, 0, 360, -r, r);
      float y = r * sqrt(1 - pow(x/r, 2)) * sin(radians(a) + phase);
      ellipse(x, y, 3, 3);
    }
  }
  popMatrix();
  
}