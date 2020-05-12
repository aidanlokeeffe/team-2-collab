class Graph {
  Node[] tiles;
  Integer[][] adjMat;
  int x0, y0;
  Node selectedTile; 
  Unit unitToMove;
  ArrayList<Integer> unitToMoveAvailTiles = new ArrayList<Integer>();
  //Player[] gamePlayers = new Player[2];
  boolean[] moveFlag = {false, false};
  int level;
  
  // IMPORTANT, because of the ordering of (i, j), the matrix below is the 
  // TRANSPOSE of what will appear on the screen. This can be frustrating
  public int tileTypes[][] = new int[][]{
  {0, 0, 0, 1, 1, 1, 1, 0, 0, 0}, 
  {0, 0, 0, 1, 1, 1, 1, 0, 0, 0},
  {0, 0, 0, 2, 2, 2, 2, 0, 0, 0}, 
  {0, 0, 0, 2, 2, 2, 2, 0, 0, 0}, 
  {0, 0, 0, 1, 1, 1, 1, 0, 0, 0}, 
  {0, 0, 0, 1, 1, 1, 1, 0, 0, 0},
  {0, 0, 0, 2, 2, 2, 2, 0, 0, 0}, 
  {0, 0, 0, 2, 2, 2, 2, 0, 0, 0}, 
  {0, 0, 0, 1, 1, 1, 1, 0, 0, 0}, 
  {0, 0, 0, 1, 1, 1, 1, 0, 0, 0}
  };
  public int tileTypes2[][] = new int[][]{
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
  };
  public int tileTypes3[][] = new int[][]{
  {0, 0, 0, 1, 1, 1, 1, 0, 0, 0}, 
  {0, 0, 0, 1, 1, 1, 1, 0, 0, 0},
  {0, 0, 0, 1, 1, 1, 1, 0, 0, 0}, 
  {0, 0, 0, 1, 1, 1, 1, 0, 0, 0}, 
  {0, 0, 0, 1, 1, 1, 1, 0, 0, 0}, 
  {0, 0, 0, 1, 1, 1, 1, 0, 0, 0},
  {0, 0, 0, 1, 1, 1, 1, 0, 0, 0}, 
  {0, 0, 0, 1, 1, 1, 1, 0, 0, 0}, 
  {0, 0, 0, 1, 1, 1, 1, 0, 0, 0}, 
  {0, 0, 0, 1, 1, 1, 1, 0, 0, 0}
  };
  
  // Make the graph
  // !!! Coded with some generality, but for our purposes, _x0 = _y0 = 35
  Graph(int _x0, int _y0, int _level) {
    tiles = new Node[100];
    adjMat = new Integer[100][100];
    this.level = _level;
    
    for(int i=0; i<100; i++){
      for(int j=0; j<100; j++){
        adjMat[i][j] = 0;
      }
    }
    
    this.x0 = _x0;
    this.y0 = _y0;
    
    this.setNodes(this.level);
    this.setEdges();
  }
  
  // I'll add every tile in the game board
  void setNodes(int level) {
    String[] horizontal = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j"};
    String[] vertical = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
    
    // Conditions for different choice of level
    if(level == 1) {
      for(int i=0; i<10; i++) {
        for(int j=0; j<10; j++) {
          String lbl = horizontal[i] + vertical[j];
          int x = x0 + i*70;
          int y = y0 + j*70;
      
          int idx = j + i*10;
      
          tiles[idx] = new Node(x, y, lbl, tileTypes[i][j]);
        }
      }
    }
    else if(level == 2) {
      for(int i=0; i<10; i++) {
        for(int j=0; j<10; j++) {
          String lbl = horizontal[i] + vertical[j];
          int x = x0 + i*70;
          int y = y0 + j*70;
      
          int idx = j + i*10;
      
          tiles[idx] = new Node(x, y, lbl, tileTypes2[i][j]);
        }
      }
    }
    else if(level == 3) {
      for(int i=0; i<10; i++) {
        for(int j=0; j<10; j++) {
          String lbl = horizontal[i] + vertical[j];
          int x = x0 + i*70;
          int y = y0 + j*70;
      
          int idx = j + i*10;
      
          tiles[idx] = new Node(x, y, lbl, tileTypes3[i][j]);
        }
      }
    }
    
  }
  
  // We'll add all the connections between the tiles
  void addEdge(int p, int q, int cost) {
    adjMat[p][q] = cost;
  }
  void setEdges() {
    for(int i=0; i<100; i++) {
      if(tiles[i].type == 2) {continue; }
      
      int[] adjSet;
      if(i==0){
        adjSet = new int[]{1, 10};
      }
      else if(1 <= i && i <= 8){
        adjSet = new int[]{i-1, i+10, i+1};
      }
      else if(i==9){
        adjSet = new int[]{8, 19};
      }
      else if(i%10 == 0 && i > 0 && i < 90){
        adjSet = new int[]{i-10, i+10, i+1};
      }
      else if(i%10 == 9 && i > 9 && i < 99){
        adjSet = new int[]{i-1, i+10, i-10};
      }
      else if(i==99){
        adjSet = new int[]{89, 98};
      }
      else if(91 <= i && i <= 98){
        adjSet = new int[]{i-1, i-10, i+1};
      }
      else if(i==90){
        adjSet = new int[]{80, 91};
      }
      else{
        adjSet = new int[]{i-1, i+10, i+1, i-10};
      }
      
      for(int j : adjSet) {
        addEdge(i, j, tiles[j].cost);
        
        
      
      }
    }
  }
  
  // Give me a string, and I'll tell you if I contain that guy
  boolean hasVertex(String lbl) {
    int nVert = tiles.length;
    
    for(int i=0; i<nVert; i++) {
      if (lbl.equals(tiles[i].getLabel())) {
        return true;
      }
    }
    return false;
  }
  
  // Give me a string, and I'll give you that guy's index,
  // but if I don't have it, I'll give you -1
  int getIndex(String lbl) {
    int nVert = tiles.length;
  
    for(int i=0; i<nVert; i++) {
      if (this.tiles[i].getLabel().equals(lbl)) {
        return i;
      }
    }
    return -1;  
  }
  
  // Give me a label, and I'll give you the index of an adjacent vertex that hasn't 
  // been visited. But if all adjacent verticies are visited, then I return -1
  int getAdjUnvisitedVertex(int idx) {
    int nVert = tiles.length;
    
    for(int i=0; i<nVert; i++) {
      if(this.adjMat[idx][i] > 0 && !this.tiles[i].wasVisited()) {
        return i;
      }
    }
    return -1;
  }

  
  // This is a budgeted breadth-first search
  ArrayList<Integer> availableTiles(String label, int budget) {
    // Outputs are recorded here
    ArrayList outList = new ArrayList<Integer>();
    
    // These are required for the algorithm
    Queue<Integer> idxQueue = new LinkedList<Integer>();
    Queue<Integer> bgtQueue = new LinkedList<Integer>();
    ArrayList<Integer> unreachable = new ArrayList<Integer>();
    
    // This takes care of the tile corresponding to the input label, and initiates the while loop to follow
    int curr = this.getIndex(label);
    this.tiles[curr].visited = true;
    int currBgt = budget;
    boolean startingLoop = true;
    
    // Begin searching for available tiles
    while(idxQueue.size() != 0 || startingLoop) {
      // This is no longer necessary
      if(startingLoop) {startingLoop = false;}
      
      int idx = this.getAdjUnvisitedVertex(curr);
      
      if(idx == -1 || currBgt <= 0) { // Then there are no adjacent nodes or there's not enough movement left to bother searching
        if(unreachable.size() != 0) { // Then there were adjecent tiles, they were just too far
          // Completely forget about all unreahable tiles for this node
          for(int i : unreachable){this.tiles[i].visited = false;} 
          unreachable.clear(); 
        }
        // Move onto the next node, with it's corresponding remaining movement
        curr = idxQueue.remove();
        currBgt = bgtQueue.remove();
      }
      else{
        int remainder = currBgt-adjMat[curr][idx]; // Calculate how much movement will be left at that tile
        this.tiles[idx].visited = true;
        if(remainder < 0) {unreachable.add(idx);} // This way, it may still be possible to reach that node, but we'll have to try a different approach
        else{ // We know we can get there, so report that node, put in in the queue to check for its neighbors, and store the corresponding movement left over at that node
          outList.add(idx);
          idxQueue.add(idx);
          bgtQueue.add(remainder);
        }
      }
    }
    for(int i=0; i<100; i++) {this.tiles[i].visited = false;} // Reset all tiles in the board, just in case, for next movement
    return outList;
  }
  
  
  

  void display() {
    for(int i=0; i<100; i++) { // Monitor each tile for if the mouse is over it
      tiles[i].update();
      if(tiles[i].selected){
        selectedTile = tiles[i]; // This is the only tile that should be highlit green
      }
      else{
        for(int j=0; j<100; j++) { // Without this, tiles that are made to be highlit green remain highlit green
          if(tiles[j] != selectedTile) {
            tiles[j].selected=false;
          }
        } // end of j-loop
      }
      if(tiles[i].selected == true) {
        selectedTile = tiles[i];
        tiles[i].display(1);
        
        // It's natural to put unit selection here
        if( this.tiles[i].isOccupied() && this.tiles[i].currentUnit.p == currentTurn && !this.moveFlag[currentTurn]) { 
          // Then someone's there, it's their turn, and the player hasn't moved yet
          this.unitToMove = this.tiles[i].currentUnit;
          String lblToPass = this.unitToMove.location;
          int mvmtToPass = this.unitToMove.movement;
          this.unitToMoveAvailTiles = this.availableTiles(lblToPass, mvmtToPass);
        }
        else if(this.unitToMove != null) {
          if( unitToMoveAvailTiles.contains(i) && !this.tiles[i].isOccupied() ) {
            String targetLabel = this.tiles[i].getLabel();
            this.unitToMove.move(targetLabel);
            this.unitToMove = null;
            this.unitToMoveAvailTiles.clear();
            this.moveFlag[currentTurn] = true;
          }
        }
      }
      else if (tiles[i].overTile() || this.unitToMoveAvailTiles.contains(this.getIndex(tiles[i].getLabel()))){
        tiles[i].display(3);
      }
      else{
        tiles[i].display(0);
      } 
    } // end of i-loop
  } // end display

}
