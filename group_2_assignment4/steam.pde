class Steam {
  float x, y, sx, sy, opacity;
  
  Steam(float x, float y) {
    this.x = x;
    this.y = y;
    this.sx = random(-1,1);
    this.sy = random(-4,-1);
    this.opacity = 255;
  }
  void display() {
    noStroke();
    fill(255,this.opacity);
    ellipse(this.x, this.y, 40,40);
  }
  
  void move() {
    if (this.y < 0) {
      this.x = 180;
      this.y = 400;
      this.opacity = 255;
    }
    this.x += this.sx;
    this.y += this.sy;
    this.opacity -= 2;
  }
}
