class Unit {
  int hp, atk, def, movement, range;
  
  float x, y;
  String location; 
  

  Unit(String label) {
    if(board.hasVertex(label)) {
      this.location = label;
      int idx = board.getIndex(label);
      this.x = board.tiles[idx].x;
      this.y = board.tiles[idx].y;
    }
    else {
      println("I don't have a tile labeled " + label);
    }
    
    
  }
  
  // show the stats of a unit on the right side of the screen when the unit is clicked/selected
  void displayStats() {}
  
  // move a unit
  void move() {}
  
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
