class NH4ClPtcl {
  float x, y;
  int n;

  NH4ClPtcl(float _x, float _y, int spriteLength) {
    this.x = _x;
    this.y = _y;
    this.n = spriteLength;
  }
  
  
  
  void fall(int t) {
    this.y += pow(t, 1.25);
  }
  
  void display() {
    image(NH4Cl_sprite[frameCount%n], x, y);
  }

}
