class Cavalry extends Unit {
  
  int hp, atk, def, movement, range;
  String id;
  
  Cavalry(float x, float y, int hp, int atk, int def) {
    super(x, y);
    this.hp = hp;
    this.atk = atk;
    this.def = def;
    this.movement = 3;
    this.range = 1;
    this.id = "Cavalry";
  }
  
  void display() {}
  
}
