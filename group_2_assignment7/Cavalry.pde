class Cavalry extends Unit {

  String id;
  int idleFrame;
  int currentFrame;

  Cavalry(String label) {
    super(label);
    this.hp = 1;
    this.atk = 1;
    this.def = 1;
    this.movement = 3;
    this.range = 1;
    this.id = "Cavalry";
  }

  void display() {
    image(cavalryIdle[frameCount/50%3], x, y);
  }
}
