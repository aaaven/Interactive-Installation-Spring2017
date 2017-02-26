# **Interactive-Installation／交互装置设计（Spring 2017**）
######@New Media Program, WPP school. Shanghai Art and Design Academy

######@上海工艺美院，WPP学院，新媒体系

##Key Info
-by Aven Le Zhou, adjunct profesoor

-Monday,9:00am-12:00pm

-Studio of New Media Program

##Week01-Introduction and Reviews-02/27/2017
-Class Intro/Overview
-Review on Processing

-Review on OOP

-Make a button in Processing

*week01-01-simple-hover*
```

//Aven,02/26/2017
//Interactive Installation
//New Media, WPP, SADA

color buttonColor = color(100);
int w = 100, h=50;

void setup() {
  size(400, 400);
  stroke(0);
  strokeWeight(1);
  
}

void draw() {
  background(100);
  fill(buttonColor);
  float bx = width*0.5 - w*0.5;
  float by = height*0.5-h*0.5;
  rect(bx, by, w, h);
  if (mouseX > bx && mouseX < bx+w &&
    mouseY > by && mouseY < by+h) {
    buttonColor = color(255, 0, 0);
  } else {
    buttonColor = color(100);
  }
}

```

##Week02-
