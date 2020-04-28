class Music {
  float x;
  float y;
  boolean state;
  boolean clicked = false;
  boolean pressed = false;
  
  Music(float x, float y) {
    this.x = x;
    this.y = y;
    this.state = false;
  }
  
  void display() {
    if (!this.isMuted()) {
      image(soundButtons[0], x, y);
    }
    else {
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
  
  //void changeState() {
  //  if (mousePressed){
  //    if (this.overButton()){
  //      this.selected = true;
  //    }
  //  }
  //  if (mousePressed && this.pressed == false) {
  //    this.pressed = true;
  //    if (this.overTile()) { //<>//
  //      this.clicked = true;
  //    }
  //    else {
  //      this.clicked = false;
  //    }
  //    if (mousePressed != true) {
  //      this.pressed = false;
  //    }
  //  }
  //}
}
