//Aven,04/09/2017
//Interactive Installation
//New Media, WPP, SADA


color[] colors;
ArrayList <Spiral> spirals;

void setup() {
  size(640, 360);
  noStroke();
  //loading();
  setupCam();
  spirals = new ArrayList();
  background(0);
}


void draw() {
  colors = getColors(cam.width, cam.height);
  println(colors.length);

  if (spirals.size() < 10) spirals.add(new Spiral(random(width), random(height)));
  if (colors.length > 0) {
    
    if (spirals.size() > 0) {
      for (int i = 0; i < spirals.size(); i++) {
        Spiral s =(Spiral) spirals.get(i);    
        if (s.toLive) {
          s.update();
          s.display();
        } else {
          spirals.remove(i);
        }
      }
    }
    
  }
}

void mouseClicked() {
  spirals.add(new Spiral(mouseX, mouseY));
}

void loading() {
  background(0);
  pushStyle();
  fill(255);
  noStroke();
  textAlign(CENTER);
  text("loading pixels...", width/2, height/2);
  popStyle();
}