class Lumberjack extends Unit {
  String id;

  Lumberjack(String label, int player) {
    super(label);
    this.hasAttacked = false;
    this.hp = 35;
    this.currenthp = 20;
    this.atk = 20;
    this.def = 5;
    this.movement = 2;
    this.range = 1;
    this.id = "Lumberjack";
    this.p = player;
    this.alive = true;
  }
  
  void display() {
    if (this.currenthp > 0) {
      if(this.p == 1){
        image(lumberjackIdle[frameCount/50%3], x, y);
      }
      else{
        image(lumberjackIdleRed[frameCount/50%3], x, y);
      }
    }
    if (this.currenthp <= 0 && this.alive == true) {
      this.alive = false;
      this.die();
    }
  }
  
  void chop() {}
  
}
