import controlP5.*;
ControlP5 cp5;
Range range, rangeX, rangeY;
Slider sliderRes, sliderPtsize;

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
    .setRangeValues(502, 4321)
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
    .setRange(topY, bottonY)
    .setRangeValues(topY, bottonY)
    // after the initialization we turn broadcast back on again
    .setBroadcast(true)
    .setColorForeground(color(20, 240))
    .setColorBackground(color(200, 240))  
    ;  

  sliderRes = cp5.addSlider("resolution")
    .setPosition(10, 70)
    .setRange(1, 10)
    .setSize(200, 15)
    .setHandleSize(5)
    .setNumberOfTickMarks(10)
    .setColorForeground(color(20, 240))
    .setColorBackground(color(200, 240))
    ;

  sliderPtsize = cp5.addSlider("pointSize")
    .setPosition(10, 90)
    .setRange(1, 10)
    .setSize(200, 15)
    .setHandleSize(5)
    .setNumberOfTickMarks(10)
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
  text(closestZ,width - 50, 35);
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


void keyPressed() {

  if (key == ' ') debug = !debug;

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

    case('r'):
    break;
  }
}