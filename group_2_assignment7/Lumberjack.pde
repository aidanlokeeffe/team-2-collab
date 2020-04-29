class Lumberjack extends Unit {
  String id;

  Lumberjack(String label, int player) {
    super(label);
    this.hp = 25;
    this.currenthp = 20;
    this.atk = 20;
    this.def = 5;
    this.movement = 2;
    this.range = 1;
    this.id = "Lumberjack";
    this.p = player;
  }
  
  void display() {
    if (this.hp > 0) {
      if(this.p == 1){
        image(lumberjackIdle[frameCount/50%3], x, y);
      }
      else{
        image(lumberjackIdleRed[frameCount/50%3], x, y);
      }
    }
  }
  
  void chop() {}
  
}
