//Aven,04/26/2017
//Interactive Installation
//New Media, WPP, SADA

//issues to fix: figure out how to map image pixels to real world coordinating system

//https://msdn.microsoft.com/en-us/library/microsoft.kinect.coordinatemapper.mapdepthframetocameraspace.aspx
//https://msdn.microsoft.com/en-us/library/windowspreview.kinect.coordinatemapper.mapcolorframetocameraspace.aspx?cs-save-lang=1&cs-lang=javascript#code-snippet-1

//show kienct capture size and angle
//http://www.smeenk.com/webgl/kinectfovexplorer.html

//http://pterneas.com/2014/05/06/understanding-kinect-coordinate-mapping/

//work with kinect v1
//https://blog.decoratorpattern.com/2011/01/23/real-world-mapping-with-the-kinect/
//http://stackoverflow.com/questions/11784888/kinect-map-x-y-pixel-coordinates-to-real-world-coordinates-using-depth
//http://stackoverflow.com/questions/17832238/kinect-intrinsic-parameters-from-field-of-view/18199938#18199938
//https://msdn.microsoft.com/en-us/library/jj131033.aspx
import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

//depth image control factors
PImage colorImg;

int depthRangeMin = 5, depthRangeMax = 4499, imgScale = 4;
PVector imgRange;
boolean debug = true;

//kinect setup
Kinect2 kinect2;


void setup() {
  size(1600, 900, P3D);
  setupCP5();
  setupCam();
  kinect2 = new Kinect2(this);

  //enable depth camera
  kinect2.initDepth();
  //enable registered image
  kinect2.initRegistered();
  //enable device
  kinect2.initDevice();

  //create color image
  colorImg = createImage(kinect2.depthWidth, kinect2.depthHeight, ARGB);

  //imageScale
  imgRange = new PVector(512*imgScale, 424*imgScale);
}


void draw() {
  background(0);
  drawGUI();

  if (debug)showCamLookAt();
  centerObject2Cam();
  if (debug)debugDraw();

  colorImg = kinect2.getRegisteredImage();
  colorImg.loadPixels();  
  int[] rawDepth = kinect2.getRawDepth();
  for (int y = 0; y < colorImg.height; y++) {
    for (int x = 0; x < colorImg.width; x++) {

      int index = y * colorImg.width + x;
      boolean inRange = rawDepth[index] >= depthRangeMin && rawDepth[index] <= depthRangeMax;
      if (inRange) {
        //show ptCloud
        stroke(colorImg.pixels[index]);
        strokeWeight(imgScale/2);
        point(imgScale*x, imgScale*y, rawDepth[index]);
      }
    }
  }
  colorImg.updatePixels();
}