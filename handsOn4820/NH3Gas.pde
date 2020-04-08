class NH3Gas {
  int Ox, Oy; int freq;
  float variance;
  ArrayList<NH3Ptcl> particles = new ArrayList<NH3Ptcl>();

  NH3Gas(int _Ox, int _Oy, float _var, int _freq) {
    this.Ox = _Ox;
    this.Oy = _Oy;
    this.variance = _var;
    this.freq = _freq;
  }
  
  void injectGas() {
    if(frameCount%freq == 0) {
      NH3Ptcl nextPtcl = new NH3Ptcl(Ox, Oy, variance, 2);
      particles.add(nextPtcl);
      //print(particles.size());
    }
  }

  void update() {
    for(int i=0; i<particles.size(); i++){
      particles.get(i).motion();
    }
  }
  
  void display() {
    for(int i=0; i<particles.size(); i++){
      particles.get(i).display();
    }
  }

}
