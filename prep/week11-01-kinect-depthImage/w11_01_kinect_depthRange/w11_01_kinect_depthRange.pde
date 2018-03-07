//Aven,04/23/2017
//Interactive Installation
//New Media, WPP, SADA

/* key functions: 
 
 setup: __.initDepth();
 __.initDevice();
 
 run:   __.getRawDepth();          --return depth array (raw)
 
 */


import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

Kinect2 kinect2;
float min, max;

void setup() {
  size(512, 424, P2D);
  kinect2 = new Kinect2(this);

  //enable depth camera
  kinect2.initDepth();
  //enable device
  kinect2.initDevice();
  //find depth range
}


void draw() {
  background(0);
  PVector range = findDepthRange(kinect2);
  println(range);
  min = range.x;
  max = range.y;
  println("depth range: [ " + min + "," + max + "]");
  image(kinect2.getDepthImage(), 0, 0);
}


PVector findDepthRange(Kinect2 k2) {
  int[] rawDepth = k2.getRawDepth(); 
  int _min = 100000, _max = 0;
  for (int i=0; i < rawDepth.length; i++) {
    if (_min > rawDepth[i]) min = rawDepth[i];
    if (_max < rawDepth[i]) max = rawDepth[i];
  }

  PVector range = new PVector(min, max);
  return range;
}