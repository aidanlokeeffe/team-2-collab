class Infantry extends Unit {

  Infantry(String label, int player) {
    super(label);
    this.hasAttacked = false;
    this.hp = 35;
    this.currenthp = 35;
    this.atk = 15;
    this.def = 15;
    this.movement = 3;
    this.range = 1;
    this.id = "Infantry";
    this.p = player;
    this.alive = true;
  }
  
  void display() {
    if (this.currenthp > 0) {
      if(this.p == 0){
        image(infantryIdle[frameCount/50%3], x, y);
      }
      else{
        image(infantryIdleRed[frameCount/50%3], x, y);
      }
    }
    if (this.currenthp <= 0 && this.alive == true) {
      this.alive = false;
      this.die();
    }
  }
  
}
