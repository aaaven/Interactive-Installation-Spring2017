import controlP5.*;
ControlP5 cp5;
Range range;


void setupCP5() {
  cp5 = new ControlP5(this);
  cp5.setAutoDraw(false);
  range = cp5.addRange("rangeController")
    // disable broadcasting since setRange and setRangeValues will trigger an event
    .setBroadcast(false) 
    .setPosition(10, 10)
    .setSize(200, 15)
    .setHandleSize(5)
    .setRange(0, 4499)
    .setRangeValues(5, 4499)
    // after the initialization we turn broadcast back on again
    .setBroadcast(true)
    .setColorForeground(color(20, 240))
    .setColorBackground(color(200, 240))  
    ;             
  noStroke();
}

void drawGUI() {
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();

  cp5.draw();
  
  //frameRate monitoring
  fill(255);
  textSize(10);
  text(frameRate, width - 50, 20);

  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}

void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.isFrom("rangeController")) {
    depthRangeMin = int(theControlEvent.getController().getArrayValue(0));
    depthRangeMax = int(theControlEvent.getController().getArrayValue(1));
  }
}