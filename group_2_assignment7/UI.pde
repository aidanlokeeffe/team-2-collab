color Player1 = color(35, 63, 242);
color Player2 = color(255, 0, 0);
color textColor = color(0);
color buttonBase = color(133, 87, 35);
color buttonColor;
int currentPlayer;
boolean endTurnPressed = false;

class UI{
  
  UI(){
  }
  
  void updateEndTurn(){
    if (overEndTurn()){
      buttonColor = color(255);
      if(mousePressed&& endTurnPressed == false) {
        endTurnPressed = true;
        if(currentTurn == 0){
          currentTurn = 1;
        }
        else{
          currentTurn = 0;
        }
        board.unitToMoveAvailTiles.clear();
        board.selectedTile = null;
      }
      else if(!mousePressed){
        endTurnPressed = false;
      }
    }
  
  }
  
  boolean overEndTurn(){
    if (mouseX > 890 - (180 / 2) && mouseX < 890 + (180 / 2) && mouseY > 660 - (40 / 2) && mouseY <  660 + (40 / 2)) {
      return true;
    } 
    else{
      return false;
    }
  }

  
  void display(int currentTurn, Node selectedTile){
    
      
    //change colors based on player
    if (currentTurn == 0){
      fill(Player1);
      rect(700, 0, 300, 700);
      currentPlayer = 1;
      buttonColor = Player2;
    
    }else{
      fill(Player2);
      rect(700, 0, 300, 700);
      currentPlayer = 2; 
      buttonColor = Player1;
    }
    
     updateEndTurn();
     //end turn button
    fill(buttonBase);
    rect(790, 630, 200, 60, 25, 25, 25, 25);
    fill(buttonColor);
    rect(800, 640, 180, 40, 20, 20, 20, 20);

    
    //UI text
    fill(textColor);
    textSize(30);
    text("Player " + currentPlayer +"'s turn!", 710, 30);
    textSize(20);
    text("End Turn", 850, 665);
    

    
    //shows data of a character if a tile with one is selected
    if (selectedTile == null){
    }
    else if (selectedTile.isOccupied() == true){
      selectedTile.currentUnit.displayStats(selectedTile.currentUnit); //<>//
      selectedTile.currentUnit.displayCombat();
    }
    else{
    }
   
     
    
    
  
  }
  
}
