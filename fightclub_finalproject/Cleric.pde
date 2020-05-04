class Cleric extends Unit {
  
  Cleric(String label, int player) {
    super(label);
    this.hasAttacked = false;
    this.hp = 25;
    this.currenthp = 25;
    this.atk = 5;
    this.def = 5;
    this.movement = 2;
    this.range = 3;
    this.id = "Archer";
    this.p = player;
    this.alive = true;
  }
  
  void display() {
    if (this.currenthp > 0) {
      if (this.p == 0){
        image(clericIdle[frameCount/50%3], x, y);
      }
      else{
        image(clericIdleRed[frameCount/50%3], x, y);
      }
    }
    if (this.currenthp <= 0 && this.alive == true) {
      this.alive = false;
      this.die();
    }
  }
  
}
