// Spooky Stream Save
// by Krister Olsson <http://www.tree-axis.com>

// Sound is generated in realtime, with pitch and 
// pan controlled by the mouse. Streaming of generated 
// sound to a file can be started/stopped by pressing 
// any key
//
// Sound is saved to "spookyStream.aif"

// Created 9 May 2006

// AUDIO
import krister.Ess.*;
AudioStream myStream;
SquareWave myWave1;
SquareWave myWave2;
int oldFrequency=0;
int frequency;

// FILE MANAGEMENT
int count = 0;
int charByte[];
char[] allChars;
String lines[];
char linesChar[];
int lineLength;

// TIMER
Timer globalTimer;
Timer tapTimer;



// SETUP
void setup() {
  size(256,200);

  // FILE
  lines = loadStrings("data/file.txt");
  for (int i=0; i < lines.length; i++) {

    lineLength = lines[i].length();
    println(lineLength);

    allChars = new char[lines[i].length()];

    for (int j=0; j < lineLength; j++) {
      allChars[j] = lines[i].charAt(j);
      //println(allChars[j]);
    }
  }

  // timer start
  globalTimer = new Timer(1000);
  globalTimer.start();

  // timer start
  tapTimer = new Timer(10);
  tapTimer.start();

  // start up Ess
  Ess.start(this);

  // create a new AudioStream
  myStream=new AudioStream();

  // our waves
  myWave1=new SquareWave(0,.33);
  myWave2=new SquareWave(0,.66);


  // start
  myStream.start();
} // END setup



// DRAW
void draw() {
  lines = loadStrings("data/file.txt");
  // globalTimer
  if (globalTimer.isFinished()) {
    background(random(255));

    globalTimer = new Timer(lineLength * 100);

    globalTimer.start();
  }

  // TAPTIMER
  if (tapTimer.isFinished()) {

    tapTimer = new Timer(100);

    tapTimer.start();

    if (allChars[0] != 0) {
      playSound();
    }
  }
} // END draw


void keyPressed() {
  if (key == ' ') {
    //playSound();
  }
}



// KEYPRESSED
void playSound() {
  //if(allChars[count] =! null) {

  if (count < lineLength) {

    switch (allChars[count]) {
    case 'A': 
      frequency=10;
      break;
    case 'B': 
      frequency=20;
      break;
    case 'C': 
      frequency=30;
      break;
    case 'D': 
      frequency=40;
      break;
    case 'E': 
      frequency=50;
      break;
    case 'F': 
      frequency=60;
      break;
    case 'G': 
      frequency=70;
      break;
    case 'H': 
      frequency=80;
      break;
    case 'I': 
      frequency=90;
      break;
    case 'J': 
      frequency=100;
      break;
    case 'K': 
      frequency=110;
      break;
    case 'L': 
      frequency=120;
      break;
    case 'M': 
      frequency=130;
      break;
    case 'N': 
      frequency=140;
      break;
    case 'O': 
      frequency=150;
      break;
    case 'P': 
      frequency=160;
      break;
    case 'Q': 
      frequency=170;
      break;
    case 'R': 
      frequency=180;
      break;
    case 'S': 
      frequency=190;
      break;
    case 'T': 
      frequency=200;
      break;
    case 'U': 
      frequency=210;
      break;
    case 'V': 
      frequency=220;
      break;
    case 'W': 
      frequency=230;
      break;
    case 'X': 
      frequency=240;
      break;
    case 'Y': 
      frequency=250;
      break;
    case 'Z': 
      frequency=260;
      break;
    case ' ': 
      frequency=0;
      break;
    }


    count ++;
  }
  
  if (count >= lineLength) {
    count = 0;
  }
} // END keypressed




// SOUND GENERATING
void audioStreamWrite(AudioStream theStream) {

  // next wave
  //frequency=mouseY;

  myWave1.generate(myStream);
  myWave2.generate(myStream,Ess.ADD);

  // adjust our phases
  myWave1.phase+=myStream.size;
  myWave1.phase%=myStream.sampleRate; 
  myWave2.phase=myWave1.phase;


  if (frequency!=oldFrequency) {
    // we have a new frequency    
    myWave1.frequency=frequency;

    // non integer frequencies can cause timing issues with our simple timing code
    myWave2.frequency=(int)(frequency*4.33); 

    myWave1.phase=myWave2.phase=0;

    // out with the old

    println("Playing frequency: "+frequency);

    oldFrequency=frequency;
  }
}




// we are done, clean up Ess
public void stop() {
  Ess.stop();
  super.stop();
}

