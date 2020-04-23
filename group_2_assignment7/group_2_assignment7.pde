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

Graph board;


void setup() {
  size(1000, 700);
  imageMode(CENTER);
  background(25);
  
  plainsSprite = makeSprite("plains_", 3, ".png");
  forestSprite = makeSprite("forest_", 3, ".png");
  waterSprite = makeSprite("water_", 3, ".png");
  
  //testSprite = makeSprite("test_", 1, ".png");
  
  board = new Graph(35, 35);
  
}

void draw() {
  line(700, 0, 700, 700);
  board.display();
  
  // Comment this out when not debugging
  for(int[] pSet : board.debug) {
    line(pSet[0], pSet[1], pSet[2], pSet[3]);
  }
  
  
}
