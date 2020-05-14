class Platoon {
  int x = 0;
  int y = 665;
  int horseX = -180;
  int horseY = 595;
  float wizardX =width;
  float wizardY = 105;
  float fireX;
  float fireY;
  float frequency = PI/2;

  Platoon() {
    this.wizardX = width;
    this.wizardY = 105;
    this.fireX = width;
    this.fireY = 145;
  }

  void display() {
    image(infantryAttack[frameCount/20%4], this.x, this.y);
    image(infantryAttack[frameCount/20%4], this.x-70, this.y);
    image(infantryAttack[frameCount/20%4], this.x-140, this.y);
  }

  void displayCavalry() {
    image(cavalryAttack[frameCount/20%4], this.horseX, this.horseY);
    if (this.x - 140 > width) {
      this.horseX = -180;
      this.horseY = 595;
    }
    if (this.horseX < this.x + 70) {
      this.horseX += 4;
    }
    else {
      this.horseX += 2;
      if (this.horseY < 665) {this.horseY += 4;}
    }
  }

void move() {
  if (this.x - 140 > width) {
    this.x = 0;
    this.y = 665;
  }
  this.x += 2;
}

void displayWizard() {
  image(wizardAttackRed[frameCount/20%4], this.wizardX, this.wizardY);
  this.wizardY += .25 * cos(frequency);
  if (this.wizardX < 0) {this.wizardX = width;}
  this.wizardX -= 1;
  image(fireBall[frameCount/20%3], this.fireX, this.fireY);
  if (this.fireX < 0) {this.fireX = width -2;}
  this.fireX += 5 * sin(frequency) - 1;
  this.fireY += 5 * cos(frequency) + .25 * cos(frequency);
  frequency += .1;
}

void displayIdles() {
  image(wizardIdleRed[frameCount/30%3], 105, 245);
  image(wizardIdleRed[frameCount/30%3], 35, 315);
  image(infantryIdleRed[frameCount/30%3], 35, 245);
  image(cavalryIdle[frameCount/30%3], 948.5, 455);
  image(cavalryIdle[frameCount/30%3], 878.5, 455);
  image(wizardIdle[frameCount/30%3], 878.5, 525);
}

}
