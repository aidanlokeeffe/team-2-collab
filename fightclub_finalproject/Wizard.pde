class Wizard extends Unit {
  
  Wizard(String label, int player) {
    super(label);
    this.hasAttacked = false;
    this.hp = 25;
    this.currenthp = 25;
    this.atk = 30;
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
        image(wizardIdle[frameCount/50%3], x, y);
      }
      else{
        image(wizardIdleRed[frameCount/50%3], x, y);
      }
    }
    if (this.currenthp <= 0 && this.alive == true) {
      this.alive = false;
      this.die();
    }
  }
  
}
