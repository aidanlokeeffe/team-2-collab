class Unit {
  int hp, atk, def, movement, range;
  
  float x, y;
  String square; 
  

  Unit(String label) {
    if(board.hasVertex(label)) {
      this.square = label;
      int idx = board.getIndex(label);
      this.x = board.tiles[idx].x;
      this.y = board.tiles[idx].y;
    }
    else {
      println("I don't have a tile labeled " + label);
    }
    
    
  }
  
  void findPath() {}

}
