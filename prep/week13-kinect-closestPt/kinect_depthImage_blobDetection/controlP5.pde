import controlP5.*;
ControlP5 cp5;
Range range;
float scale = 0.3;


void setupCP5() {
  cp5 = new ControlP5(this);
  range = cp5.addRange("depthRange")
    // disable broadcasting since setRange and setRangeValues will trigger an event
    .setBroadcast(false) 
    .setPosition(10, 10)
    .setSize(300, 15)
    .setHandleSize(5)
    .setRange(0, 4499)
    .setRangeValues(15, 3000)
    // after the initialization we turn broadcast back on again
    .setBroadcast(true)
    .setColorForeground(color(20, 240))
    .setColorBackground(color(200, 240))
    ;  

  cp5.addSlider("scale")
    .setPosition(10, height-20)
    .setWidth(512)
    .setRange(0, 1) // values can range from big to small as well
    .setValue(0.3)
    .setColorForeground(color(20, 240))
    .setColorBackground(color(200, 240))
    ;

  cp5.setAutoDraw(false);
  noStroke();
}

void drawGUI() {
  
  cp5.draw();

  pushMatrix();
  translate(10, 35);
  scale(scale);
  image(depthImg, 0, 0);
  popMatrix();
  
  fill(255);
  textSize(10);
  text(frameRate, width - 50, 20);  //frameRate monitoring
}

void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.isFrom("depthRange")) {
    depthRangeMin = int(theControlEvent.getController().getArrayValue(0));
    depthRangeMax = int(theControlEvent.getController().getArrayValue(1));
  }
}

void keyPressed() {
  if (key == ' ')debug = !debug;
  
  switch(key) {

    //SET setting data
    case('1'):
    cp5.getProperties().setSnapshot("setting01");
    break;
    case('2'):
    cp5.getProperties().setSnapshot("setting02");
    break;
    case('3'):
    cp5.getProperties().setSnapshot("setting03");
    break;

    //READ setting
    case('q'):
    cp5.getProperties().getSnapshot("setting01");
    break;
    case('w'):
    cp5.getProperties().getSnapshot("setting02");
    break;
    case('e'):
    cp5.getProperties().getSnapshot("setting03");
    break;
    /*
    case('z'):
     cp5.getProperties().removeSnapshot("hello1");
     break;
     case('x'):
     cp5.getProperties().removeSnapshot("hello2");
     break;
     case('c'):
     cp5.getProperties().removeSnapshot("hello3");
     break;
     */

    //SAVE setting
    case('a'):
    cp5.getProperties().saveSnapshot("setting01");
    break;
    case('s'):
    cp5.getProperties().saveSnapshot("setting02");
    break;
    case('d'):
    cp5.getProperties().saveSnapshot("setting03");
    break;

    //LOAD setting
    case('z'):
    cp5.getProperties().load("setting01.json");
    break;
    case('x'):
    cp5.getProperties().load("setting02.json");
    break;
    case('c'):
    cp5.getProperties().load("setting03.json");
    break;
  }
}