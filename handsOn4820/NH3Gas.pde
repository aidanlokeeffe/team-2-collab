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
  
  // checks if two NH3 particles collide and if true has them bounce off each other
  void collides() {
    for (int i = 0; i<particles.size(); i++) {
      for (int j = i+1; j<particles.size() - i; j++) {
        float d = dist(particles.get(i).x, particles.get(i).y, particles.get(j).x, particles.get(j).y);
        if (d < 2 * 8) {
          particles.get(i).velocity.x *= pow(-1, 1);
          particles.get(i).velocity.y *= pow(-1, 1);
          particles.get(i).x += particles.get(i).velocity.x;
          particles.get(i).y += particles.get(i).velocity.y;
          particles.get(j).velocity.x *= pow(-1, 1);
          particles.get(j).velocity.y *= pow(-1, 1);
          particles.get(j).x += particles.get(i).velocity.x;
          particles.get(j).y += particles.get(i).velocity.y;
          //println("NH3 overlap by ", d, " pixels");
        }
      }
    }
  }

}
