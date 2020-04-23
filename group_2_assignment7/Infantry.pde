class Infantry extends Unit {
  
  int hp, atk, def, movement, range;
  String id;

  Infantry(float x, float y,int hp, int atk, int def) {
    super(x, y);
    this.hp = hp;
    this.atk = atk;
    this.def = def;
    this.movement = 2;
    this.range = 1;
    this.id = "Infantry";
  }
  
  void display() {}
  
}
