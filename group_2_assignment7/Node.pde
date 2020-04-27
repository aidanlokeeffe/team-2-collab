class Node {
  int x, y;
  String label;
  public boolean occupied = false;
  public boolean visited = false;
  boolean clicked;
  boolean pressed;
  int type;
  int cost;
  PImage[] tileSprite = new PImage[3];
  boolean selected = false; 
  int p;
  Unit currentUnit;
  
  // Constructor 
  Node(int _x, int _y, String _label, int _type) {
    this.x = _x;
    this.y = _y;
    this.label = _label;
    this.type = _type;
    this.clicked = false;
    this.pressed = false;
    
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
 
 boolean isOccupied() {
   return this.occupied;
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
  
  // checks if mouse cursor is over tile
  boolean overTile(){
    if (mouseX > this.x - (70 / 2) && mouseX < this.x + (70 / 2) && mouseY > this.y - (70 / 2) && mouseY < this.y + (70 / 2)) {
      return true;
    } 
    else{
      return false;
    }
  }
  
  void update() {
    if (mousePressed){
      if (this.overTile()){
        this.selected = true;
      }
    }
    
    
    // DO NOT CLEAR THIS
    // code to be used later
    //if (mousePressed && this.pressed == false) {
    //  this.pressed = true;
    //  if (this.overTile()) { //<>// //<>//
    //    this.clicked = true;
    //  }
    //  else {
    //    this.clicked = false;
    //  }
    //  if (mousePressed != true) {
    //    this.pressed = false;
    //  }
    //}
  }
  
  boolean isClicked() {
    return this.clicked;
  }
  
  
  
  
  
  
  
  

}
