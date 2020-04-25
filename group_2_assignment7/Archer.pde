class Archer extends Unit {
  
  String id;
  
  Archer(String label) {
    super(label);
    this.hp = 1;
    this.atk = 1;
    this.def = 1;
    this.movement = 2;
    this.range = 2;
    this.id = "Archer";
  }
  
  void display() {
    if (this.hp > 0) {
      image(archerIdle[frameCount/50%3], x, y);
    }
  }
  
}
