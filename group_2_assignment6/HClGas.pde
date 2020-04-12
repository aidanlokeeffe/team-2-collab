class HClGas {
  int Ox, Oy; int freq;
  float variance;
  public ArrayList<HClPtcl> particles = new ArrayList<HClPtcl>();
  NH4ClBody product;

  HClGas(int _Ox, int _Oy, float _var, int _freq) {
    this.Ox = _Ox;
    this.Oy = _Oy;
    this.variance = _var;
    this.freq = _freq;
  }
  
  void injectGas() {
    if(frameCount%freq == 0) {
      HClPtcl nextPtcl = new HClPtcl(Ox, Oy, variance, 2);
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
  
  // checks if two HCL particles collide and if true has them bounce off each other
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
          //println("HCL overlap by ", d, " pixels");
        }
      }
    }
  }
  
  // method causes a reaction or collision between particles when HCL collides with NH3
  void reacts(NH3Gas gas, NH4ClBody product) {
    for (int i = particles.size() - 1; i >= 0; i--) {
      for (int j = gas.particles.size() - 1; j >= 0; j--) {
        float d = dist(particles.get(i).x, particles.get(i).y, gas.particles.get(j).x, gas.particles.get(j).y);
        if (d < 2 * 10) {
          float rxnChance = random(0, 100);
          if (rxnChance < 100/5) {
            
            int newX = int((gas.particles.get(j).x + particles.get(i).x)/2);
            int newY = int((gas.particles.get(j).y + particles.get(i).y)/2);
            
            product.formSolid(newX, newY);
            gas.particles.remove(j);
            particles.remove(i);
            println("HCL and NH3 reacted with overlap of ", d, " pixels");
            return;
            
          } 
          else {
            particles.get(i).velocity.x *= pow(-1, 1);
            particles.get(i).velocity.y *= pow(-1, 1);
            particles.get(i).x += particles.get(i).velocity.x;
            particles.get(i).y += particles.get(i).velocity.y;
            gas.particles.get(j).velocity.x *= pow(-1, 1);
            gas.particles.get(j).velocity.y *= pow(-1, 1);
            gas.particles.get(j).x += particles.get(i).velocity.x;
            gas.particles.get(j).y += particles.get(i).velocity.y;
            //println("HCL and NH3 only collided with overlap of ", d, " pixels");
          }
        }
      }
    }
  }
}
