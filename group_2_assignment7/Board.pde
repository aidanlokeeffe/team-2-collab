class Board {
  Tile tiles[][] = new Tile[10][10];
  int x, y;
  public int tileTypes[][] = new int[][]{
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {1, 1, 1, 2, 2, 2, 2, 1, 1, 1}, 
  {1, 1, 2, 2, 2, 2, 2, 2, 1, 1}, 
  {1, 1, 2, 2, 2, 2, 2, 2, 1, 1},
  {1, 1, 1, 2, 2, 2, 2, 1, 1, 1}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
  };
  
  
  // Give this the coordinates for the top left tile's center
  Board(int x0, int y0) {
    this.x = x0;
    this.y = y0;
    
    for(int i = 0; i < 10; i++){
      for(int j = 0; j < 10; j++) {
        tiles[i][j] = new Tile(x + i*70, y + j*70, tileTypes[i][j]);
      }
    } 
  }
  
  void display() {
    for(int i = 0; i < 10; i++){
      for(int j = 0; j < 10; j++) {
        tiles[i][j].display(0);
      }
    
    }
  }




}
