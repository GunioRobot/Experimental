PImage img;  // Declare variable "a" of type PImage

int cnt = 0;

void setup() {
  size(400,400);
  background(0);
  frame.setResizable(true);
  //  byte[] data=loadBytes(loadPath);
  //  img = loadImage(loadPath);
  //  saveBytes("bentoutput.jpg",data);
  //  size(img.width,img.height,P2D);
}

void draw() {
  if (img != null) {
    image(img, 0, 0);
  }
}

void keyPressed() {

  // bend file once
  if (key == ' ') {
    byte[] data=loadBytes("bentoutput.jpg");

    int loc=(int)random(128,data.length);//guess at header being 128 bytes at most..
    data[loc]=(byte)random(255);

    saveBytes("bentoutput.jpg",data); 
    img = loadImage("bentoutput.jpg");
    image(img, 0, 0);
  }

  // 10 mods in a row
  if (key == '1') {
    for (int i=0; i<10; i++)
    {
      byte[] data=loadBytes("bentoutput.jpg");

      int loc=(int)random(128,data.length);//guess at header being 128 bytes at most..
      data[loc]=(byte)random(255);

      saveBytes("bentoutput.jpg",data); 
      img = loadImage("bentoutput.jpg");
      image(img, 0, 0);
    }
  }

  // choose file from prompt
  if (key == 'o') {
    chooseImage();
  }
}

void chooseImage() {
  // select input file
  String loadPath = selectInput();  // Opens file chooser

  if (loadPath == null) {

    // If a file was not selected
    img = loadImage("picture.jpg");
    size(img.width,img.height,P2D);
    println("No file was selected...");
  } 

  else {

    // If a file was selected, use path to file
    println(loadPath);
    byte[] data=loadBytes(loadPath);
    img = loadImage(loadPath);
    saveBytes("bentoutput.jpg",data);
    //size(img.width,img.height,P2D);
    frame.setSize(img.width,img.height);
    image(img, 0, 0);
  }
}

