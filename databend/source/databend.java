import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.*; 
import java.awt.image.*; 
import java.awt.event.*; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class databend extends PApplet {

PImage a;  // Declare variable "a" of type PImage

public void setup() {
  background(0);
  byte[] data=loadBytes("picture.jpg");
  a = loadImage("picture.jpg");
  saveBytes("picturee.jpg",data);
  size(a.width,a.height,P2D);
}

public void draw() {
  byte[] data=loadBytes("picturee.jpg");
  for(int i=0;i<4;i++) // 100 changes
  {
    int loc=(int)random(128,data.length);//guess at header being 128 bytes at most..
    data[loc]=(byte)random(255);
  }
  saveBytes("picturee.jpg",data);
  a = loadImage("picturee.jpg");
  image(a, 0, 0); 
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#F0F0F0", "databend" });
  }
}
