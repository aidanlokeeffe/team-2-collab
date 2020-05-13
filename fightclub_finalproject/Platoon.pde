class Platoon {
  int x = 0;
  int y = 630;
  int horseX = -180;
  int horseY = 560;

  Platoon() {
  }

  void display() {
    image(infantryAttack[frameCount/20%4], this.x, this.y);
    image(infantryAttack[frameCount/20%4], this.x-70, this.y);
    image(infantryAttack[frameCount/20%4], this.x-140, this.y);
  }

  void displayHierarchy() {
    image(cavalryAttack[frameCount/20%4], this.horseX, this.horseY);
    if (this.x - 140 > width) {
      this.horseX = -180;
      this.horseY = 560;
    }
    if (this.horseX < this.x + 70) {
      this.horseX += 4;
    }
    else {
      this.horseX += 2;
      if (this.horseY < 630) {this.horseY += 4;}
    }
  }

void move() {
  if (this.x - 140 > width) {
    this.x = 0;
    this.y = 630;
  }
  this.x += 2;
}
}
