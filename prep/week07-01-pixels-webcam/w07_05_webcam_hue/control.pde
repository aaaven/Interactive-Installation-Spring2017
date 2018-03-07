import controlP5.*;
ControlP5 cp5;

int colorMin = 50;
int colorMax = 700;

Range range;

void setupCP5() {
  cp5 = new ControlP5(this);
  range = cp5.addRange("colorRange")
    // disable broadcasting since setRange and setRangeValues will trigger an event
    .setBroadcast(false) 
    .setPosition(20, 20)
    .setSize(300, 20)
    .setHandleSize(10)
    .setRange(0, 765)
    .setRangeValues(50, 700)
    // after the initialization we turn broadcast back on again
    .setBroadcast(true)
    .setColorForeground(color(255, 40))
    .setColorBackground(color(0))  
    ;            
  noStroke();
}



void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.isFrom("colorRange")) {
    // min and max values are stored in an array.
    // access this array with controller().arrayValue().
    // min is at index 0, max is at index 1.
    colorMin = int(theControlEvent.getController().getArrayValue(0));
    colorMax = int(theControlEvent.getController().getArrayValue(1));
    println("range update, done.");
  }
}

void keyPressed() {
  switch(key) {
    case('1'):range.setLowValue(0);break;
    case('2'):range.setLowValue(100);break;
    case('3'):range.setHighValue(120);break;
    case('4'):range.setHighValue(200);break;
    case('5'):range.setRangeValues(40,60);break;
  }
}