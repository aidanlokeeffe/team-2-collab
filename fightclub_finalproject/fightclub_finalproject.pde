import java.util.LinkedList;
import java.util.Queue;
import java.util.Arrays;

// music setup
import processing.sound.*;
SoundFile file;
Music soundButton;

boolean start = false;
TitleButton startb;

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
public static PImage[] TitleScreen = new PImage[1];

// PLayer 1 unit sprites
// Idle Sprites
public static PImage[] cavalryIdle = new PImage[3];
public static PImage[] archerIdle = new PImage[3];
public static PImage[] infantryIdle = new PImage[3];
public static PImage[] lumberjackIdle = new PImage[3];
public static PImage[] wizardIdle = new PImage[3];
public static PImage[] clericIdle = new PImage[3];

// Movement and Attack Sprites
public static PImage[] archerAttack = new PImage[4];
public static PImage[] cavalryAttack = new PImage[4];
public static PImage[] infantryAttack = new PImage[4];
public static PImage[] lumberjackAttack = new PImage[4];
public static PImage[] wizardAttack = new PImage[4];

// Player 2 unit sprites
// Idle Sprites
public static PImage[] cavalryIdleRed = new PImage[3];
public static PImage[] archerIdleRed = new PImage[3];
public static PImage[] infantryIdleRed = new PImage[3];
public static PImage[] lumberjackIdleRed = new PImage[3];
public static PImage[] wizardIdleRed = new PImage[3];
public static PImage[] clericIdleRed = new PImage[3];

// Movement and Attack Sprites
public static PImage[] archerAttackRed = new PImage[4];
public static PImage[] cavalryAttackRed = new PImage[4];
public static PImage[] infantryAttackRed = new PImage[4];
public static PImage[] lumberjackAttackRed = new PImage[4];
public static PImage[] wizardAttackRed = new PImage[4];

//sound button sprite
public static PImage[] soundButtons = new PImage[2];
public static PImage[] TitleLogo = new PImage[1];

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
  TitleScreen = makeSprite("Title_Screen_", 1, ".png");

  // Create all unit sprites
  // Blue Unit Idle Sprites
  cavalryIdle = makeSprite("Cavalry_Idle_", 3, ".png");
  archerIdle = makeSprite("Archer_Idle_", 3, ".png");
  infantryIdle = makeSprite("Infantry_Idle_", 3, ".png");
  lumberjackIdle = makeSprite("Lumberjack_Idle_", 3, ".png");
  wizardIdle = makeSprite("Wizard_Idle_", 3, ".png");
  clericIdle = makeSprite("Cleric_Idle_", 3, ".png");
  
  // Blue Unit Attack/Movement Sprites
  archerAttack = makeSprite("Archer_Attack_", 4, ".png");
  cavalryAttack = makeSprite("Cavalry_Attack_", 4, ".png");
  infantryAttack = makeSprite("Infantry_Attack_", 4, ".png");
  lumberjackAttack = makeSprite("Lumberjack_Attack_", 4, ".png");
  wizardAttack = makeSprite("Wizard_Attack_", 4, ".png");
  
  // Red Unit Idle Sprites
  cavalryIdleRed = makeSprite("Cavalry_Idle_Enemy_", 3, ".png");
  archerIdleRed = makeSprite("Archer_Idle_Enemy_", 3, ".png");
  infantryIdleRed = makeSprite("Infantry_Idle_Enemy_", 3, ".png");
  lumberjackIdleRed = makeSprite("Lumberjack_Idle_Enemy_", 3, ".png");
  wizardIdleRed = makeSprite("Wizard_Idle_Enemy_", 3, ".png");
  clericIdleRed = makeSprite("Cleric_Idle_Enemy_", 3, ".png");
  
  // Red Unit Attack/Movement Sprites
  archerAttackRed = makeSprite("Archer_Attack_Enemy_", 4, ".png");
  cavalryAttackRed = makeSprite("Cavalry_Attack_Enemy_", 4, ".png");
  infantryAttackRed = makeSprite("Infantry_Attack_Enemy_", 4, ".png");
  //lumberjackAttackRed = makeSprite("Lumberjack_Attack_Enemy_", 4, ".png");
  wizardAttackRed = makeSprite("Wizard_Attack_Enemy_", 4, ".png");
  
  //create sound button spirte
  soundButtons = makeSprite("Sound_", 2, ".png");
  
  // title and menu buttons
  startb = new TitleButton(width/2, height/2 + 250, 200, 100);
  TitleLogo = makeSprite("Title_Logo_", 1, ".png");
  
  board = new Graph(35, 35);
  
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
  
  if (start == true) {
  board.display();
  
  P1.display();
  P2.display();
  
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
  
  else {
    image(TitleScreen[0], width/2, height/2);
    image(TitleLogo[0], width/2, height/2 - 100);
    startb.display();
    if (startb.isClicked()) {
      start = true;
    }
  }

}
