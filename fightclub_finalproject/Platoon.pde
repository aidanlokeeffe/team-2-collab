class Platoon {
  int x = 0;
  int y = 630;
  int horseX = -180;
  int horseY = 560;
  float wizardX =width;
  float wizardY = 105;
  float fireX;
  float fireY;
  float frequency = PI/2;

  Platoon() {
    this.wizardX = width;
    this.wizardY = 245;
    this.fireX = width;
    this.fireY = 285;
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

void displayWizard() {
  image(wizardAttackRed[frameCount/20%4], this.wizardX, this.wizardY);
  this.wizardY += 5 * cos(frequency);
  if (this.wizardX < 0) {this.wizardX = width;}
  this.wizardX -= 1;
  print(" ",this.wizardY," ");
  image(fireBall[frameCount/20%3], this.fireX, this.fireY);
  this.fireX += 5 * sin(frequency) - 1;
  this.fireY += 5 * cos(frequency) + 5 * cos(frequency);
  frequency += .1;
}

}
