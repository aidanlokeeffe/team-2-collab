class Graph {
  Node[] tiles;
  Integer[][] adjMat;
  int x0, y0;
  Node selectedTile; 
  Unit unitToMove;
  ArrayList<Integer> unitToMoveAvailTiles = new ArrayList<Integer>();
  
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
  
  // Make the graph
  // !!! Coded with some generality, but for our purposes, _x0 = _y0 = 35
  Graph(int _x0, int _y0) {
    tiles = new Node[100];
    adjMat = new Integer[100][100];
    
    for(int i=0; i<100; i++){
      for(int j=0; j<100; j++){
        adjMat[i][j] = 0;
      }
    }
    
    this.x0 = _x0;
    this.y0 = _y0;
    
    this.setNodes();
    this.setEdges();
  }
  
  // I'll add every tile in the game board
  void setNodes() {
    String[] horizontal = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j"};
    String[] vertical = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
    
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
  
  // Give me a label and a budget, and I'll give you an ArrayList of 
  // the INDICES of all the tiles that are within your budget
  ArrayList<Integer> availableTiles(String label, int budget) {
    ArrayList<Integer> outList = new ArrayList<Integer>();
    
    ArrayList<Integer> budgets = new ArrayList<Integer>();
    
    Stack<Integer> idxStack = new Stack<Integer>();
    Stack<Integer> expStack = new Stack<Integer>();
    
    int myPosn = this.getIndex(label);
    idxStack.push(myPosn);
    this.tiles[myPosn].visited = true;
    expStack.push(0);
    
    int currBgt = budget;
    
    while(idxStack.size() != 0) {
      int prev = idxStack.peek();
      int curr = this.getAdjUnvisitedVertex(prev);
      if(curr == -1 || currBgt <= 0) {
        idxStack.pop();
        currBgt += expStack.pop();
      }
      else {
        this.tiles[curr].visited = true;
        int cost = this.adjMat[prev][curr];
        if(currBgt - cost >= 0) {
          idxStack.push(curr);
          expStack.push(cost);
          currBgt -= cost;
          outList.add(curr);
        }
      }
      budgets.add(currBgt);
    }
    
    
    for(int i=0; i<100; i++) {
      this.tiles[i].visited = false;
    }
    
    
    return outList;
  
  }
  
  
  
  


  void display() {
    for(int i = 0; i < 10; i++){
      for(int j = 0; j < 10; j++) {
       tiles[10*i + j].update();
       if (tiles[10*i + j].selected){
         selectedTile = tiles[10*i + j];
       }
       else{
         for(int x = 0; x < 10; x++){
           for(int y = 0; y < 10; y++) {
             if (tiles[10*x + y] != selectedTile){
               tiles[10*x + y].selected = false;
             }
           }
         }
       }
       if (tiles[10*i + j].selected == true){ 
          tiles[10*i + j].display(1);
          
          // These are the conditions for movement
          if( this.tiles[10*i+j].isOccupied() && this.tiles[10*i+j].currentUnit.p == currentTurn ){
            this.unitToMove = this.tiles[10*i+j].currentUnit;
            String lblToPass = this.unitToMove.location;
            int mvmtToPass = this.unitToMove.movement;
            this.unitToMoveAvailTiles = this.availableTiles(lblToPass, mvmtToPass);
            println(unitToMoveAvailTiles);
          }
          else if(this.unitToMove != null) {
            if( unitToMoveAvailTiles.contains(10*i+j) && !this.tiles[10*i+j].isOccupied() ) {
              String targetLabel = this.tiles[10*i+j].getLabel();
              this.unitToMove.move(targetLabel);
              this.unitToMove = null;
              this.unitToMoveAvailTiles.clear();
            }
          
          
          }
          
          
          
          
          
          
        }
       else if (tiles[10*i + j].overTile() || this.unitToMoveAvailTiles.contains(this.getIndex(tiles[10*i+j].getLabel()))){
            tiles[10*i + j].display(3);
        }
        else{
          tiles[10*i + j].display(0);
        }

      }
    
    }
  }
  
  
  
  
  
  
  




}
