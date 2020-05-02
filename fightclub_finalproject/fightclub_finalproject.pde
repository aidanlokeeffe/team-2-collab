import java.util.LinkedList;
import java.util.Queue;
import java.util.Arrays;

// music setup
import processing.sound.*;
SoundFile file;
Music soundButton;

//toggles wether or not music plays
void togglePlay() {
  if (!file.isPlaying()) {
    file.loop();
  }
  else {
    file.pause();
  }
}


// This function makes sprite arrays for us
PImage[] makeSprite(String nameStr, int len, String imgType) {
  PImage[] outArray = new PImage[len];
  for(int i=0; i<len; i++) {
    String imgName = nameStr + nf(i) + imgType;
    outArray[i] = loadImage(imgName);
  }
  return outArray;
}

// All the geographic sprites
public static PImage[] plainsSprite = new PImage[3];
public static PImage[] forestSprite = new PImage[3];
public static PImage[] waterSprite = new PImage[3];

// PLayer 1 unit sprites
public static PImage[] cavalryIdle = new PImage[3];
public static PImage[] archerIdle = new PImage[3];
public static PImage[] infantryIdle = new PImage[3];

//Player 2 unit sprites
public static PImage[] cavalryIdleRed = new PImage[3];
public static PImage[] archerIdleRed = new PImage[3];
public static PImage[] infantryIdleRed = new PImage[3];

//sound button sprite
public static PImage[] soundButtons = new PImage[2];

// Graph is public so as to be accessible by unit classes //<>// //<>// //<>//
public Graph board;


// The players
public Player P1;
public Player P2;

//P1 = 0, P2 = 1
int currentTurn = 0;

//Declare the UI
UI userInterface = new UI();

void setup(){
  // Basic setup
  size(1000, 700);
  imageMode(CENTER);
  background(25);
  
    // Create all geosprites
  plainsSprite = makeSprite("plains_", 4, ".png");
  forestSprite = makeSprite("forest_", 4, ".png");
  waterSprite = makeSprite("water_", 4, ".png");

  // Create all unit sprites
  cavalryIdle = makeSprite("Cavalry_Idle_", 3, ".png");
  archerIdle = makeSprite("Archer_Idle_", 3, ".png");
  infantryIdle = makeSprite("Infantry_Idle_", 3, ".png");

  cavalryIdleRed = makeSprite("Cavalry_Idle_Enemy_", 3, ".png");
  archerIdleRed = makeSprite("Archer_Idle_Enemy_", 3, ".png");
  infantryIdleRed = makeSprite("Infantry_Idle_Enemy_", 3, ".png");
  
  //create sound button spirte
  soundButtons = makeSprite("Sound_", 2, ".png");
  
  // Create players
  P1 = new Player(0);
  P2 = new Player(1);
  
  //play music
  file = new SoundFile(this, "DistantLand.wav");
  //UNCOMMENT BELOW B4 WE SUBMIT SO MUSIC PLAYS
  //file.loop();
  soundButton = new Music(735, 665);
  

}

void draw(){
  
  //display the UI
  userInterface.display(currentTurn);
  
  
  //display the sound button and toggle music if it is pressed
  soundButton.display();
  if (soundButton.isMuted() && soundButton.paused == false) {
    togglePlay();
    soundButton.paused = true;
  }
  else if (!(soundButton.isMuted()) && soundButton.paused == true){
    togglePlay();
    soundButton.paused = false;
  }

}
