class Infantry extends Unit {
  String id;

  Infantry(String label) {
    super(label);
    
    
    this.hp = 1;
    this.atk = 1;
    this.def = 1;
    this.movement = 2;
    this.range = 1;
    this.id = "Infantry";
  }
  
  void display() {
    if (this.hp > 0) {
      image(infantryIdle[frameCount/50%3], x, y);
    }
  }
  
}
