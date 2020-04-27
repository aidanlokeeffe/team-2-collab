class Archer extends Unit {
  
  String id;
  
  Archer(String label, int player) {
    super(label);
    this.hp = 20;
    this.atk = 20;
    this.def = 5;
    this.movement = 2;
    this.range = 2;
    this.id = "Archer";
    this.p = player;
  }
  
  void display() {
    if (this.hp > 0) {
      if (this.p == 1){
        image(archerIdle[frameCount/50%3], x, y);
      }
      else{
        image(archerIdleRed[frameCount/50%3], x, y);
      }
    }
  }
  
}
