class Tile {
  boolean isOccipued = false;
  int x, y;
  public int type;
  public int cost;
  PImage[] tileSprite = new PImage[3];
  
  Tile(int _x, int _y, int _type) {
    this.x = _x;
    this.y = _y;
    this.type = _type;
    
    // 0: Plains, 1: Forest, 2: Water
    if(type == 0) {
      cost = 1;   
      tileSprite = plainsSprite;
    }
    else if(type == 1) {
      cost = 2;
    }
    else if(type == 2) {
      cost = 10;
    }
  }
  
  void display(int frame) {
    if(type == 0) {
      image(plainsSprite[frame], x, y);   
    }
    else if(type == 1) {
      image(forestSprite[frame], x, y);  
    }
    else if(type == 2) {
      image(waterSprite[frame], x, y);
    }
    
  }

}
