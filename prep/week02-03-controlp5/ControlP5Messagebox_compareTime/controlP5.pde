import controlP5.*;
import processing.opengl.*;
ControlP5 cp5;
ControlGroup messageBox;
int messageBoxResult = -1;
String messageBoxString = "";
String popUpMessage = "Hey Boss, what should I go to work?";
int h = 23, m = 59;
void setupControlP5() {
  cp5 = new ControlP5(this);
  createMessageBox();
  Button b = cp5.addButton("toggleBox", 1, 20, 20, 100, 20);
  b.setLabel("Show/Hide");
  textFont(createFont("", 30));
}

void messageBox() {
  hint(ENABLE_DEPTH_TEST);
  if (messageBox.isVisible()) {
    background(255);
  } else {
    background(0);
    fill(255);
  }
  hint(DISABLE_DEPTH_TEST);
  // in case yo uare using the camera or you have 
  // changed the default camera setting, reset the camera
  // to default by uncommenting the following line.
  camera();
}

void toggleBox(int theValue) {
  if (messageBox.isVisible()) {
    messageBox.hide();
  } else {
    messageBox.show();
  }
}


void createMessageBox() {
  // create a group to store the messageBox elements
  messageBox = cp5.addGroup("messageBox", width/2 - 150, 100, 300);
  messageBox.setBackgroundHeight(120);
  messageBox.setBackgroundColor(color(0, 100));
  messageBox.hideBar();

  // add a TextLabel to the messageBox.
  Textlabel l = cp5.addTextlabel("messageBoxLabel", popUpMessage, 20, 20);
  l.moveTo(messageBox);

  // add a textfield-controller with named-id inputbox
  // this controller will be linked to function inputbox() below.
  Textfield f = cp5.addTextfield("inputbox", 20, 36, 260, 20);
  f.getCaptionLabel().setVisible(false);
  f.moveTo(messageBox);
  f.setColorForeground(color(20));
  f.setColorBackground(color(20));
  f.setColorActive(color(100));
  // add the OK button to the messageBox.
  // the name of the button corresponds to function buttonOK
  // below and will be triggered when pressing the button.
  Button b1 = cp5.addButton("buttonOK", 0, 65, 80, 80, 24);
  b1.moveTo(messageBox);
  b1.setColorBackground(color(40));
  b1.setColorActive(color(20));
  // by default setValue would trigger function buttonOK, 
  // therefore we disable the broadcasting before setting
  // the value and enable broadcasting again afterwards.
  // same applies to the cancel button below.
  b1.setBroadcast(false); 
  b1.setValue(1);
  b1.setBroadcast(true);
  b1.setCaptionLabel("OK");
  // centering of a label needs to be done manually 
  // with marginTop and marginLeft
  //b1.captionLabel().style().marginTop = -2;
  //b1.captionLabel().style().marginLeft = 26;

  // add the Cancel button to the messageBox. 
  // the name of the button corresponds to function buttonCancel
  // below and will be triggered when pressing the button.
  Button b2 = cp5.addButton("buttonCancel", 0, 155, 80, 80, 24);
  b2.moveTo(messageBox);
  b2.setBroadcast(false);
  b2.setValue(0);
  b2.setBroadcast(true);
  b2.setCaptionLabel("Cancel");
  b2.setColorBackground(color(40));
  b2.setColorActive(color(20));
  //b2.captionLabel().toUpperCase(false);
  // centering of a label needs to be done manually 
  // with marginTop and marginLeft
  //b2.captionLabel().style().marginTop = -2;
  //b2.captionLabel().style().marginLeft = 16;
}

// function buttonOK will be triggered when pressing
// the OK button of the messageBox.
void buttonOK(int theValue) {
  println("a button event from button OK.");
  messageBoxString = ((Textfield)cp5.getController("inputbox")).getText();
  messageBoxResult = theValue;
  messageBox.hide();
  if (messageBoxString != "") {
    String[] inputTimeStr = split(messageBoxString, ":");
    h = Integer.parseInt(inputTimeStr[0]);
    m = Integer.parseInt(inputTimeStr[1]);
  }
}


// function buttonCancel will be triggered when pressing
// the Cancel button of the messageBox.
void buttonCancel(int theValue) {
  println("a button event from button Cancel.");
  messageBoxResult = theValue;
  messageBox.hide();
}

// inputbox is called whenever RETURN has been pressed 
// in textfield-controller inputbox 
void inputbox(String theString) {
  println("got something from the inputbox : "+theString);
  messageBoxString = theString;
  messageBox.hide();
}