class Unit { //<>//
  int hp, currenthp, atk, def, movement, range;
  String id;
  float x, y;
  public String location; 
  int p;

  Unit(String label) {
    if (board.hasVertex(label)) {
      this.location = label;
      int idx = board.getIndex(label);
      this.x = board.tiles[idx].x;
      this.y = board.tiles[idx].y;
      board.tiles[idx].occupied = true;
      board.tiles[idx].currentUnit = this;
    } else {
      println("I don't have a tile labeled " + label);
    }
  }

  // show the stats of a unit on the right side of the screen when the unit is clicked/selected
  void displayStats(Unit unitToDisplay) {
    String unitID = unitToDisplay.id;
    if (this.p ==0) {
      fill(192, 125, 240); //<>//
      rect(720, 60, 260, 240, 25, 25, 25, 25);   
      if (unitID == "Archer") {
        image(archerIdle[0], 900, 100);
      } else if (unitID == "Cavalry") {
        image(cavalryIdle[0], 900, 100);
      } else if (unitID == "Infantry") {
        image(infantryIdle[0], 900, 100);
      }
    } else {
      fill(229, 195, 71);
      rect(720, 60, 260, 240, 25, 25, 25, 25);
      if (unitID == "Archer") {
        image(archerIdleRed[0], 900, 100);
      } else if (unitID == "Cavalry") {
        image(cavalryIdleRed[0], 900, 100);
      } else if (unitID == "Infantry") {
        image(infantryIdleRed[0], 900, 100);
      }
    }
    textSize(30);
    fill(0);
    text(unitID, 730, 100);
    textSize(20);
    text("HP: "+ unitToDisplay.currenthp +"/" + unitToDisplay.hp, 730, 130);
    text("Attack:" + unitToDisplay.atk, 730, 160);
    text("Defense:" + unitToDisplay.def, 730, 190);
    text("Movement:" + unitToDisplay.movement, 730, 220);
    text("Range:" + unitToDisplay.range, 730, 250);
  }

  // move a unit
  void move(String label) {
    int currIdx = board.getIndex(this.location);
    int nextIdx = board.getIndex(label);

    if ( !board.tiles[nextIdx].isOccupied() ) {
      board.tiles[nextIdx].occupied = true;
      board.tiles[nextIdx].currentUnit = this;
      board.tiles[currIdx].occupied = false;
      board.tiles[currIdx].currentUnit = null;



      Integer[] coords = board.tiles[nextIdx].getCoords();
      this.x = coords[0];
      this.y = coords[1];
      this.location = label;
    } else {
      println("Someone is standing here");
    }
  }

  ArrayList<Integer> checkForEnemies() {

    ArrayList<Integer> adjacentTiles = new ArrayList<Integer>();
    ArrayList<Integer> attackableTiles = new ArrayList<Integer>();
    //  get the label of the tile unit is on
    int unitIndex = board.getIndex(this.location);
    //if the tile is selected
    if (board.tiles[unitIndex].selected) {
      //println(unitIndex);
      // get adjacent tiles
      adjacentTiles.add(unitIndex+1); 
      adjacentTiles.add(unitIndex-1);
      adjacentTiles.add(unitIndex+10);
      adjacentTiles.add(unitIndex-10);
      //print(adjacentTiles.get(0),adjacentTiles.get(1),adjacentTiles.get(2),adjacentTiles.get(3));
      // check if enemies are on adjacent tiles
      for (int i = 0; i<adjacentTiles.size(); i++) {
        if (adjacentTiles.get(i) < 0 || adjacentTiles.get(i) > 99) {
          continue;
        }
        if (board.tiles[adjacentTiles.get(i)].isOccupied() && board.tiles[unitIndex].currentUnit.p != board.tiles[adjacentTiles.get(i)].currentUnit.p) {
          attackableTiles.add(adjacentTiles.get(i));
          //print("/",adjacentTiles.get(i),"/");
        }
      }
    }
    //return arrayList of tiles that can be attacked;
    return attackableTiles;
  }

  void displayCombat() {
    int unitIndex = board.getIndex(this.location);
    ArrayList<Integer> enemyPositions = this.checkForEnemies();
    if (enemyPositions.size() > 0) {
      print(enemyPositions.get(0));
      if (p == 0) {
        fill(192, 125, 240);
      } else {
        fill(229, 195, 71);
      }
      rect(720, 310, 260, 280, 25, 25, 25, 25);
      String unitId = board.tiles[unitIndex].currentUnit.id;
      int numEnemies = enemyPositions.size();
      ArrayList<String> enemyIds = new ArrayList<String>();
      for (int i=0; i < numEnemies; i++) {
        enemyIds.add(board.tiles[enemyPositions.get(i)].currentUnit.id);
      }
      textSize(30);
      fill(0);
      for (int i=0; i < numEnemies; i++) {
        this.combatForecast(p, unitId, enemyIds.get(i), 755, 345+i*70, 840, 345+i*70);
        text("VS", 795, 345+i*75);
      }
    }
  }

  void combatForecast(int p, String unitId, String enemyId, int x1, int y1, int x2, int y2) {
    if (p == 1) {
      int xp, yp;
      xp = x1;
      yp = y1;
      x1 = x2;
      y1 = y2;
      x2 = xp;
      y2 = yp;
    }
    if (unitId == "Archer") {
      if (enemyId == "Archer") {
        image(archerIdle[0], x1, y1);
        image(archerIdleRed[0], x2, y2);
      }
      if (enemyId == "Cavalry") {
        image(archerIdle[0], x1, y1);
        image(cavalryIdleRed[0], x2, y2);
      }
      if (enemyId == "Infantry") {
        image(archerIdle[0], x1, y1);
        image(infantryIdleRed[0], x2, y2);
      }
    }
    if (unitId == "Cavalry") {
      if (enemyId == "Archer") {
        image(cavalryIdle[0], x1, y1);
        image(archerIdleRed[0], x2, y2);
      }
      if (enemyId == "Cavalry") {
        image(cavalryIdle[0], x1, y1);
        image(cavalryIdleRed[0], x2, y2);
      }
      if (enemyId == "Infantry") {
        image(cavalryIdle[0], x1, y1);
        image(infantryIdleRed[0], x2, y2);
      }
    }
    if (unitId == "Infantry") {
      if (enemyId == "Archer") {
        image(infantryIdle[0], x1, y1);
        image(archerIdleRed[0], x2, y2);
      }
      if (enemyId == "Cavalry") {
        image(infantryIdle[0], x1, y1);
        image(cavalryIdleRed[0], x2, y2);
      }
      if (enemyId == "Infantry") {
        image(infantryIdle[0], x1, y1);
        image(infantryIdleRed[0], x2, y2);
      }
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
  void die() {
  }
}
