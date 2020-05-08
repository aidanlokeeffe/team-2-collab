class TitleButton {
  
  float x;
  float y;
  float w;
  float l;
  boolean state;
  boolean pressed = false;
  
  TitleButton(float x, float y, float w, float l) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.l = l;
    this.state = false;
    this.pressed = false;
  }
  
  boolean isClicked() {
    return this.state;
  }
  
  boolean overButton() {
    if (mouseX > this.x - (this.w / 2) && mouseX < this.x + (this.w / 2) && mouseY > this.y - (this.l / 2) && mouseY < this.y + (this.l / 2)) {
      return true;
    } else {
      return false;
    }
  }
  
  void update() {  
    if (mousePressed && this.pressed == false) {
      this.pressed = true;
      if (this.overButton()) {
        this.state = !this.state;
      }
    }
    else if (mousePressed != true) {
        this.pressed = false;
      }
  }
  
  void display() {
    this.update();
    if (this.overButton()) {
      fill(210,214,217);
      rectMode(CENTER);
      rect(this.x, this.y, this.w, this.l);
      rectMode(CORNER);
      fill(0,211,0);
      textSize(32);
      text("START",this.x - textWidth("START")/2 ,this.y + 32/2);
    }
    else {
      fill(127);
      rectMode(CENTER);
      rect(this.x, this.y, this.w, this.l);
      rectMode(CORNER);
      fill(242,207,43);
      textSize(32);
      text("START",this.x - textWidth("START")/2 ,this.y + 32/2);
    }
  }
  
}
