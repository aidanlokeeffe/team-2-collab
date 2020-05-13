class Platoon {
  int x = 0;
  int y = 630;
  
  Platoon() {}
  
  void display() {
    image(infantryAttack[frameCount/20%4], this.x, this.y);
    image(infantryAttack[frameCount/20%4], this.x-70, this.y);
    image(infantryAttack[frameCount/20%4], this.x-140, this.y);
  }
  
  void move() {
    if (this.x - 140 > width) {
      this.x = 0;
      this.y = 630;
    }
    this.x += 2;
  }
}
