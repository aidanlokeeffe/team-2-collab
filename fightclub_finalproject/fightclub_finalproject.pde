import java.util.Stack;
import java.util.Arrays;
import processing.sound.*;
SoundFile file;


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

//P1 = 0, P2 = 1
int currentTurn = 0;

//Declare the UI
UI userInterface = new UI();

void setup(){
  // Basic setup
  size(1000, 700);
  imageMode(CENTER);
  background(25);
  

}

void draw(){
  userInterface.display(currentTurn); //<>//

}
