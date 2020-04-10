class HClPtcl extends GasPtcl {
  int n;
  
  HClPtcl(float x0, float y0, float _var, int spriteLength) {
    super(x0, y0, _var);
    this.n = spriteLength;
  }

  void display() {
    image(HCl_sprite[frameCount%n], x, y);
  }





}
