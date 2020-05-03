class Archer extends Unit {

  Archer(String label, int player) {
    super(label);
    this.hasAttacked = false;
    this.hp = 25;
    this.currenthp = 25;
    this.atk = 20;
    this.def = 5;
    this.movement = 2;
    this.range = 3;
    this.id = "Archer";
    this.p = player;
    this.alive = true;
  }

  void display() {
    if (this.currenthp > 0) {
      if (board.tiles[board.getIndex(this.location)].selected) {
        if (this.p == 0) {
          image(archerAttack[frameCount/50%3], x, y);
        } 
        else {
          image(archerAttackRed[frameCount/50%3], x, y);
        }
      }
      else {
        if (this.p == 0) {
          image(archerIdle[frameCount/50%3], x, y);
        } else {
          image(archerIdleRed[frameCount/50%3], x, y);
        }
      }
    }
    if (this.currenthp <= 0 && this.alive == true) {
      this.alive = false;
      this.die();
    }
  }
}
