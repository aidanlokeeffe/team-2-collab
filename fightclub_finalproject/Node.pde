class Node{
  int x, y;
  String label;
  int type;
  PImage[] tileSprite = new PImage[3];
  public boolean occupied = false;
  


//Constructor
  Node(int _x, int _y, String _label, int _type){
    this.x = _x;
    this.y = _y;
    this.label = _label;
    this.type = _type;
    
    // 0: Plains, 1: Forest, 2: Water
    if(type == 0) {  
      tileSprite = plainsSprite;
      //cost = 1;
    }
    else if(type == 1) {
      tileSprite = forestSprite;
      //cost = 2;
    }
    else if(type == 2) {
      tileSprite = waterSprite;
    }
  }
  
  //returns strue if the node is occupied
  boolean isOccupied() {
   return this.occupied;
 }
  
  //show image of the node
  void display(int frame) {
    image(tileSprite[frame], x, y);       
  }


}
