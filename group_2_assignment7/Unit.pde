 class Unit {
  int hp, atk, def, movement, range;
  
  float x, y;
  String location; 
  int p;

  Unit(String label) {
    if(board.hasVertex(label)) {
      this.location = label;
      int idx = board.getIndex(label);
      this.x = board.tiles[idx].x;
      this.y = board.tiles[idx].y;
      board.tiles[idx].occupied = true;
      
    }
    else {
      println("I don't have a tile labeled " + label);
    }
    
    
  }
  
  // show the stats of a unit on the right side of the screen when the unit is clicked/selected
  void displayStats() {}
  
  // move a unit
  void move(String label) {
    int currIdx = board.getIndex(this.location);
    int nextIdx = board.getIndex(label);
    
    if( !board.tiles[nextIdx].isOccupied() ) {
      board.tiles[currIdx].occupied = false;
      Integer[] coords = board.tiles[nextIdx].getCoords();
      this.x = coords[0];
      this.y = coords[1];
      this.location = label;
    }
    else{
      println("Someone is standing here");
    }
  
  }
  
  
  
  // attacking unit attacks other unit
  void attack(Unit otherUnit) {
    int damage = this.atk;
    int newHealth = otherUnit.hp - damage;
    otherUnit.hp = newHealth;
  }
  
  // when a units hp drops below zero I have it stopped being displayed in its display method but it will still exist so we must erase it because other
  // units might need to occupy its space
  // change tile.isOccupied to false
  void die() {}
  
}
