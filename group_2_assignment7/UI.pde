color Player1 = color(35, 63, 242);
color P1Accent = color(201, 234, 255);
color Player2 = color(255, 0, 0);
color P2Accent = color(255, 145, 145);
color turnFont = color(244, 194, 13);
int currentPlayer;

class UI{
  
  UI(){
  }

  
  void display(boolean currentTurn, Node selectedTile){
    
    if (currentTurn){
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
    
    if (selectedTile == null){
    }
    else if (selectedTile.isOccupied() == true){
      showCharacterInfo(selectedTile.label); //<>//
    }
    else{
    }
  
  }
  
  void showCharacterInfo(String unitAtTile){
    Unit toDisplay;
   //P1.swords;
  
  }
  
  
  
}
