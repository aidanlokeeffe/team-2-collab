class Infantry extends Unit {
  String id;

  Infantry(String label, int player) {
    super(label);
    
    
    this.hp = 1;
    this.atk = 1;
    this.def = 1;
    this.movement = 2;
    this.range = 1;
    this.id = "Infantry";
    this.p = player;
  }
  
  void display() {
    if (this.hp > 0) {
      if(this.p == 1){
        image(infantryIdle[frameCount/50%3], x, y);
      }
      else{
        image(infantryIdleRed[frameCount/50%3], x, y);
      }
    }
  }
  
}
