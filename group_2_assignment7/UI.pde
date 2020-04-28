color Player1 = color(35, 63, 242);
color Player2 = color(255, 0, 0);
color turnFont = color(0);
int currentPlayer;

class UI{
  
  UI(){
  }

  
  void display(int currentTurn, Node selectedTile){
    
    if (currentTurn == 0){
      fill(Player1);
      rect(700, 0, 300, 700);
      currentPlayer = 1;
    
    }else{
      fill(Player2);
      rect(700, 0, 300, 700);
      currentPlayer = 2; 
    }
    fill(turnFont);
    textSize(30);
    text("Player " + currentPlayer +"'s turn!", 710, 30);
    
    //shows data of a character if a tile with one is selected
    if (selectedTile == null){
    }
    else if (selectedTile.isOccupied() == true){
      selectedTile.currentUnit.displayStats(selectedTile.currentUnit);  //<>//
    }
    else{
    }
  
  }
  
  
  
  
}
