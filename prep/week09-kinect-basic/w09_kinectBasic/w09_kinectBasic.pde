//Aven,04/23/2017
//Interactive Installation
//New Media, WPP, SADA

// check out Daniel Shiffman's examples:
// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/

/* key functions: 

setup: __.initVideo();
       __.initDepth();
       __.initIR();
       __.initRegistered();
       
       __.initDevice();
       
run:   __.getVideoImage();        --return color image
       __.getDepthImage();        --return depth image 
       __.getIRImage();           --return IR image
       __.getRegisteredImage();   --return color image
       
       --.colorWidth
       __.colorHeight             -- color image size
       
       --.depthWidth
       --.depthHeight             --depth image size
       
*/
import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

Kinect2 kinect2;
boolean showVideo = true;

void setup() {
  size(1024, 848, P2D);
  kinect2 = new Kinect2(this);

  kinect2.initVideo();
  kinect2.initDepth();
  kinect2.initIR();
  kinect2.initRegistered();

  // Start all data
  kinect2.initDevice();
}


void draw() {
  background(0);

  if (showVideo)image(kinect2.getVideoImage(), 0, 0);
  else {
    image(kinect2.getVideoImage(), 0, 0, width/2, height/2);
    image(kinect2.getDepthImage(), width/2, 0);
    image(kinect2.getIrImage(), 0, height/2);
    image(kinect2.getRegisteredImage(), width/2, height/2);
  }
  fill(255);
  text(frameRate, 10, 20);
  text(kinect2.colorWidth + " x " +  kinect2.colorHeight, 10, 40);
  text(kinect2.depthWidth + " x " + kinect2.depthHeight, 10, 60);
}

void keyPressed() {
  if (key == ' ') showVideo = ! showVideo;
}