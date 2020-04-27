color Player1 = color(35, 63, 242);
color Player2 = color(255, 0, 0);
color turnFont = color(244, 194, 13);
String currentPlayer;

class UI{
  
  UI(){
  }

  
  void display(boolean currentTurn, Node selectedTile){
    
    if (currentTurn){
      fill(Player1);
      rect(700, 0, 300, 700);
      currentPlayer = "1";
    
    }else{
      fill(Player2);
      rect(700, 0, 300, 700);
      currentPlayer = "2"; 
    }
    fill(turnFont);
    textSize(30);
    text("Player " + currentPlayer +"'s turn!", 710, 30);
    
    if (selectedTile == null){
    }
    else if (selectedTile.isOccupied == true){
      print("occupied");
    }
    else{
    }
  
  }
  

  
  
  
}
