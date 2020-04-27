color Player1 = color(35, 63, 242);
color Player2 = color(255, 0, 0);
color turnFont = color(244, 194, 13);

class UI{
  
  UI(){
  }

  
  void display(boolean currentTurn){
    
    if (currentTurn){
      fill(Player1);
      rect(700, 0, 300, 700);
    
    }else{
      fill(Player2);
      rect(700, 0, 300, 700);
    }
    
    
  
  }
  
}
