import java.util.Stack;
import java.util.Arrays;

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

// All the unit sprites
public static PImage[] cavalryIdle = new PImage[3];
public static PImage[] archerIdle = new PImage[3];
public static PImage[] infantryIdle = new PImage[3];

// Graph is public so as to be accessible by unit classes
public Graph board;

/*Cavalry testcav;
Archer testarch;
Infantry testinf;*/

// The players
Player P1;
Player P2;

void setup() {
  // Basic setup
  size(1000, 700);
  imageMode(CENTER);
  background(25);
  
  
  // Create all geosprites
  plainsSprite = makeSprite("plains_", 3, ".png");
  forestSprite = makeSprite("forest_", 3, ".png");
  waterSprite = makeSprite("water_", 3, ".png");
  
  // Create all unit sprites
  cavalryIdle = makeSprite("Cavalry_Idle_", 3, ".png");
  archerIdle = makeSprite("Archer_Idle_", 3, ".png");
  infantryIdle = makeSprite("Infantry_Idle_", 3, ".png");
  
  // Create board graph
  board = new Graph(35, 35);
  
  // This is for testing
  ArrayList<Integer> testList = board.availableTiles("a1", 7);
  //print(board.getIndex("f8"));
  print(testList);

  
  /*for(int i=0; i<100; i++){
    for(int j=0; j<100; j++) {
      if (board.adjMat[i][j] == null) {
        print("N ");
        continue;
      }
      print(board.adjMat[i][j] + " ");
    }
    print("\n");
  }*/
  
  //board.getAdjUnvisitedVertex("a1");
  // Create all units
  /*testcav = new Cavalry("a5");
  testarch = new Archer("j9");
  testinf = new Infantry("e4");*/
  
  // Create players
  P1 = new Player(1);
  P2 = new Player(2);
  
  
  
}

void draw() {
  background(25); 
  line(700, 0, 700, 700);
  board.display();
  /*testcav.display();
  testarch.display();
  testinf.display();*/
  
  // Comment this out when not debugging
  for(int[] pSet : board.debug) {
    line(pSet[0], pSet[1], pSet[2], pSet[3]);
  }
  
  P1.display();
  P2.display();
  
  
}
