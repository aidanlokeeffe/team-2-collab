class Node {
  int x, y;
  String label;
  boolean isOccupied = false;
  boolean visited = false;
  int type;
  int cost;
  PImage[] tileSprite = new PImage[3];
  
  // Constructor 
  Node(int _x, int _y, String _label, int _type) {
    this.x = _x;
    this.y = _y;
    this.label = _label;
    this.type = _type;
    
    // 0: Plains, 1: Forest, 2: Water
    if(type == 0) {  
      tileSprite = plainsSprite;
      cost = 1;
    }
    else if(type == 1) {
      tileSprite = forestSprite;
      cost = 2;
    }
    else if(type == 2) {
      tileSprite = waterSprite;
    }
    
  }
  
  boolean wasVisited() {
    return this.visited;
 }
  
  String getLabel() {
    return this.label;
  }
  
  Integer[] getCoords() {
    Integer[] outArray = new Integer[2];
    outArray[0] = this.x;
    outArray[1] = this.y;
    return outArray;
  }
  
  void display(int frame) {
    image(tileSprite[frame], x, y);       
  }
  
  
  
  
  
  
  
  

}
