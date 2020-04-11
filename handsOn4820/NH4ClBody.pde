class NH4ClBody {
  int Ox, Oy;
  ArrayList<NH4ClPtcl> particles = new ArrayList<NH4ClPtcl>();

  NH4ClBody(int _Ox, int _Oy) {
    this.Ox = _Ox;
    this.Oy = _Oy;
  }
  
  //
  void formSolid() {
    NH4ClPtcl nextPtcl = new NH4ClPtcl(Ox, Oy, 2);
    particles.add(nextPtcl);
  }

  // Pass the framecount
  void update(int t) {
    for (int i=0; i<particles.size(); i++) {
      particles.get(i).fall(t);
    }
  }

  void display() {
    for (int i=0; i<particles.size(); i++) {
      particles.get(i).display();
    }
  }
}
