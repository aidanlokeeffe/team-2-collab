class Cavalry extends Unit {

  int idleFrame;
  int currentFrame;


  Cavalry(String label, int player) {
    super(label);
    this.hp = 35;
    this.currenthp = 35;
    this.atk = 10;
    this.def = 10;
    this.movement = 4;
    this.range = 1;
    this.id = "Cavalry";
    this.p = player;
  }

  void display() {
    if (this.hp > 0) {
      if (this.p == 0){
      image(cavalryIdle[frameCount/50%3], x, y);
      }
      else{
        image(cavalryIdleRed[frameCount/50%3], x, y);
      }
    }
  }
  
}
