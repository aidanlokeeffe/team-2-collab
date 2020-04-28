class Infantry extends Unit {


  Infantry(String label, int player) {
    super(label);
    
    
    this.hp = 20;
    this.atk = 15;
    this.def = 15;
    this.movement = 2;
    this.range = 1;
    this.id = "Infantry";
    this.p = player;
  }
  
  void display() {
    if (this.hp > 0) {
      if(this.p == 0){
        image(infantryIdle[frameCount/50%3], x, y);
      }
      else{
        image(infantryIdleRed[frameCount/50%3], x, y);
      }
    }
  }
  
}
