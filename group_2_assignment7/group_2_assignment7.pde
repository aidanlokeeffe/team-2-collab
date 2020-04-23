PImage[] makeSprite(String nameStr, int len, String imgType) {
  PImage[] outArray = new PImage[len]; 
  for(int i=0; i<len; i++) {
    String imgName = nameStr + imgType;
    outArray[i] = loadImage(imgName);
  } 
  return outArray;
}

public static PImage[] plainsSprite = new PImage[3];
public static PImage[] forestSprite = new PImage[3];
public static PImage[] waterSprite = new PImage[3];

public static PImage[] testSprite = new PImage[1];

Board board;


void setup() {
  size(1000, 700);
  imageMode(CENTER);
  background(25);
  
  plainsSprite = makeSprite("Plains_Tile", 3, ".png");
  forestSprite = makeSprite("Forest_Tile", 3, ".png");
  waterSprite = makeSprite("Water_Tile", 3, ".png");
  
  testSprite = makeSprite("test_", 1, ".png");
  
  board = new Board(35, 35);
  
}

void draw() {
  line(700, 0, 700, 700);
  board.display();
}
