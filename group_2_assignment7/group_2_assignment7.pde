import java.util.Stack;

PImage[] makeSprite(String nameStr, int len, String imgType) {
  PImage[] outArray = new PImage[len]; 
  for(int i=0; i<len; i++) {
    String imgName = nameStr + nf(i) + imgType;
    outArray[i] = loadImage(imgName);
  } 
  return outArray;
}

public static PImage[] plainsSprite = new PImage[3];
public static PImage[] forestSprite = new PImage[3];
public static PImage[] waterSprite = new PImage[3];

public static PImage[] cavalryIdle = new PImage[3];
public static PImage[] archerIdle = new PImage[3];
public static PImage[] infantryIdle = new PImage[3];

Graph board;

Cavalry testcav;
Archer testarch;
Infantry testinf;


void setup() {
  size(1000, 700);
  imageMode(CENTER);
  background(25);
  
  plainsSprite = makeSprite("plains_", 3, ".png");
  forestSprite = makeSprite("forest_", 3, ".png");
  waterSprite = makeSprite("water_", 3, ".png");
  
  //testSprite = makeSprite("test_", 1, ".png");
  
  cavalryIdle = makeSprite("Cavalry_Idle_", 3, ".png");
  archerIdle = makeSprite("Archer_Idle_", 3, ".png");
  infantryIdle = makeSprite("Infantry_Idle_", 3, ".png");
  
  testcav = new Cavalry(900, 100, 1, 1, 1);
  testarch = new Archer(900, 170, 1, 1, 1);
  testinf = new Infantry(900, 240, 1, 1, 1);
  
  board = new Graph(35, 35);
  
}

void draw() {
  line(700, 0, 700, 700);
  board.display();
  testcav.display();
  testarch.display();
  testinf.display();
  
  // Comment this out when not debugging
  for(int[] pSet : board.debug) {
    line(pSet[0], pSet[1], pSet[2], pSet[3]);
  }
  
  
}
