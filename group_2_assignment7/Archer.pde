class Archer extends Unit {
  
  
  
  Archer(String label, int player) {
    super(label);
    this.hp = 25;
    this.currenthp = 25;
    this.atk = 20;
    this.def = 5;
    this.movement = 2;
    this.range = 3;
    this.id = "Archer";
    this.p = player;
  }
  
  void display() {
    if (this.hp > 0) {
      if (this.p == 0){
        image(archerIdle[frameCount/50%3], x, y);
      }
      else{
        image(archerIdleRed[frameCount/50%3], x, y);
      }
    }
  }
  
}
