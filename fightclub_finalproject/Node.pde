class Node{
  int x, y;
  String label;
  int type;
  PImage[] tileSprite = new PImage[3];
  public boolean occupied = false;
  boolean selected = false; 
  
  Unit currentUnit;
  
  // Attributes related to availableTiles
  public boolean visited = true;
  int cost;
  


//Constructor
  Node(int _x, int _y, String _label, int _type){
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
  
  // Returns true if node has been visited 
  boolean wasVisited() {
    return this.visited;
  }
  
  //returns true if the node is occupied
  boolean isOccupied() {
   return this.occupied;
  }
 
  // Returns label of node
  String getLabel() {
    return this.label;
  }
  
  Integer[] getCoords() {
    Integer[] outArray = new Integer[2];
    outArray[0] = this.x;
    outArray[1] = this.y;
    return outArray;
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
    if (this.overTile()){
      if (mousePressed){
      
        this.selected = true;
        //print("booty");
      }
    }
  }
  
  //show image of the node
  void display(int frame) {
    image(tileSprite[frame], x, y);       
  }


}
