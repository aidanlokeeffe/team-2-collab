class Archer extends Unit {
  
  int hp, atk, def, movement, range;
  String id;
  
  Archer(float x, float y, int hp, int atk, int def) {
    super(x, y);
    this.hp = hp;
    this.atk = atk;
    this.def = def;
    this.movement = 2;
    this.range = 2;
    this.id = "Archer";
  }
  
  void display() {
    image(archerIdle[frameCount/50%3], x, y);
  }
  
}
