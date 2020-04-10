class NH3Ptcl extends GasPtcl {
  int n;
  
  NH3Ptcl(float x0, float y0, float _var, int spriteLength) {
    super(x0, y0, _var);
    this.n = spriteLength;
  }

  void display() {
    image(NH3_sprite[frameCount%n], x, y);
  }





}
