import controlP5.*;
ControlP5 cp5;
Range range, rangeX, rangeY;


void setupCP5() {
  cp5 = new ControlP5(this);
  cp5.setAutoDraw(false);
  range = cp5.addRange("depthRange")
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

  rangeX = cp5.addRange("xRange")
    // disable broadcasting since setRange and setRangeValues will trigger an event
    .setBroadcast(false) 
    .setPosition(10, 30)
    .setSize(200, 15)
    .setHandleSize(5)
    .setRange(leftX, rightX)
    .setRangeValues(leftX, rightX)
    // after the initialization we turn broadcast back on again
    .setBroadcast(true)
    .setColorForeground(color(20, 240))
    .setColorBackground(color(200, 240))  
    ;  

  rangeY = cp5.addRange("yRange")
    // disable broadcasting since setRange and setRangeValues will trigger an event
    .setBroadcast(false) 
    .setPosition(10, 50)
    .setSize(200, 15)
    .setHandleSize(5)
    .setRange(topY,bottonY)
    .setRangeValues(topY,bottonY)
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
  if (theControlEvent.isFrom("depthRange")) {
    depthRangeMin = int(theControlEvent.getController().getArrayValue(0));
    depthRangeMax = int(theControlEvent.getController().getArrayValue(1));
  }
  if (theControlEvent.isFrom("xRange")) {
    leftX = int(theControlEvent.getController().getArrayValue(0));
    rightX = int(theControlEvent.getController().getArrayValue(1));
  }
  if (theControlEvent.isFrom("yRange")) {
    topY = int(theControlEvent.getController().getArrayValue(0));
    bottonY = int(theControlEvent.getController().getArrayValue(1));
  }
}