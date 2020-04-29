class Music {
  float x;
  float y;
  boolean state;
  boolean pressed = false;
  boolean paused = false;
  
  Music(float x, float y) {
    this.x = x;
    this.y = y;
    this.state = false;
    this.pressed = false;
  }
  
  void display() {
    this.update();
    if (!this.isMuted()) {
      fill(255);
      rect(700,630, 70,70);
      image(soundButtons[0], x, y);
    }
    if (this.isMuted()) {
      fill(255);
      rect(700,630, 70,70);
      image(soundButtons[1], x, y);
    }
  }

  boolean overButton() {
    if (mouseX > this.x - (70 / 2) && mouseX < this.x + (70 / 2) && mouseY > this.y - (70 / 2) && mouseY < this.y + (70 / 2)) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean isMuted() {
    return this.state;
  }
  
  void update() {  
    if (mousePressed && this.pressed == false) {
      this.pressed = true; //<>//
      if (this.overButton()) { //<>//
        this.state = !this.state;
      }
    }
    else if (mousePressed != true) {
        this.pressed = false;
      }
  } //<>//
  
}
