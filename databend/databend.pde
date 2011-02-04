String DEST_FILE = "data/bentoutput.jpg"; // Global
PImage img;  // Declare variable "a" of type PImage

int cnt = 0;

void setup() {
  size(400,400);


  background(0);
  frame.setResizable(true);
  //  byte[] data=loadBytes(loadPath);
  //  img = loadImage(loadPath);
  //  saveBytes(DEST_FILE,data);
  //  size(img.width,img.height,P2D);

  // GRAPHICS
  stroke(255);
  fill(0);
  rect(10, 10, 380, 380);
  line(20,40,380,40);

  // INSTRUCTIONS
  PFont font;
  font = loadFont("AndaleMono-12.vlw"); 
  textFont(font); 
  String title = "Databend Editor V 0.0";
  String keys = "    o \nspace \n    1";
  String actions = "..........   open file \n..........   bend once \n..........   bend ten times in a row";
  fill(255);
  text(title, 21, 21, 300, 12);
  text(keys, 20, 60,50, 300);
  text(actions, 70, 60,300, 300);
}

void draw() {
  if (img != null && ew1 != null) {
    ew1.image(img, 0, 0);
  }
}

void keyPressed() {

  keyWindowActions();

  // bend file once
  if (key == ' ') {
    byte[] data=loadBytes(DEST_FILE);

    int loc=(int)random(128,data.length);//guess at header being 128 bytes at most..
    data[loc]=(byte)random(255);

    saveBytes(DEST_FILE,data); 
    img = loadImage(DEST_FILE);
    ew1.image(img, 0, 0);
  }

  // 10 mods in a row
  if (key == '1') {
    for (int i=0; i<10; i++)
    {
      byte[] data=loadBytes(DEST_FILE);

      int loc=(int)random(128,data.length);//guess at header being 128 bytes at most..
      data[loc]=(byte)random(255);

      saveBytes(DEST_FILE,data); 
      img = loadImage(DEST_FILE);
      ew1.image(img, 0, 0);
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
    saveBytes(DEST_FILE,data);
    //size(img.width,img.height,P2D);
    if (ew1 == null) {
      ew1 = new ExtraWindow(this,"window",100,100,img.width,img.height);
    }
    //      ew1.smooth();

    //ew1.frame.setSize(img.width,img.height);
    if (ew1 != null) {
      ew1.image(img, 0, 0);
    }
  }
}

//// WINDOZ SAVE BUG
//String DEST_FILE = "numbers.dat"; // Global
//  
//// Then...
//java.io.File dataFile = sketchFile(DEST_FILE);
//if (dataFile.exists())
//{
//  dataFile.delete(); // Returns false if it cannot do it
//}
//saveBytes(DEST_FILE, nums);

