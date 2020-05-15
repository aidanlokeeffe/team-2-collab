class Cavalry extends Unit {

  Cavalry(String label, int player) {
    super(label);
    this.hasAttacked = false;
    this.hp = 55;
    this.currenthp = 55;
    this.atk = 15;
    this.def = 10;
    this.movement = 4;
    this.range = 1;
    this.id = "Cavalry";
    this.p = player;
    this.alive = true;
  }

  void display() {
    if (this.currenthp > 0) {
      if (board.tiles[board.getIndex(this.location)].selected) {
        if (this.p == 0) {
          image(cavalryAttack[frameCount/20%4], x, y);
        } 
        else {
          image(cavalryAttackRed[frameCount/20%4], x, y);
        }
      }
      else {
        if (this.p == 0) {
          image(cavalryIdle[frameCount/50%3], x, y);
        } else {
          image(cavalryIdleRed[frameCount/50%3], x, y);
        }
      }
    }
    if (this.currenthp <= 0 && this.alive == true) {
      this.alive = false;
      this.die();
    }
  }
  
}
