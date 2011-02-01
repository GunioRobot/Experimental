import controlP5.*;

PImage img;  // Declare variable "a" of type PImage
String[] filenames;
ControlP5 controlP5;
ListBox l;
int cnt = 0;

void setup() {
  background(0);
  byte[] data=loadBytes("picture.jpg");
  img = loadImage("picture.jpg");
  saveBytes("picture01.jpg",data);
  size(img.width,img.height,P2D);
  //size(400,400);


  directory();
  controlP5ListBox();
}

void draw() {
  image(img, 0, 0);
  controlP5.draw();
}

void keyPressed() {

  if(key=='c') {

    if(l!=null) {
      if (controlP5.controller("l")!=null)
      {
        //println("hidden");
        this.l.show();
      }
      else
      {
        this.l.hide();
        println("hide");
      }
    }
  }


  if (key == ' ') {
    byte[] data=loadBytes("picture01.jpg");

    int loc=(int)random(128,data.length);//guess at header being 128 bytes at most..
    data[loc]=(byte)random(255);

    saveBytes("picture01.jpg",data); 
    img = loadImage("picture01.jpg");
    image(img, 0, 0);
  }

   // 10 mods in a row
  if (key == '1') {
    for (int i=0; i<10; i++)
    {
      byte[] data=loadBytes("picture01.jpg");

      int loc=(int)random(128,data.length);//guess at header being 128 bytes at most..
      data[loc]=(byte)random(255);

      saveBytes("picture01.jpg",data); 
      img = loadImage("picture01.jpg");
      image(img, 0, 0);
    }
  }
}

