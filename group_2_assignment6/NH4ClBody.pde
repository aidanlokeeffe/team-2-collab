class NH4ClBody {
  public ArrayList<NH4ClPtcl> particles = new ArrayList<NH4ClPtcl>();
  
  // Doesn't need any paramaters upon creation
  NH4ClBody(){
  }
  
  // Use this to put a new NH4Cl particle in the particles array list
  void formSolid(int _x, int _y) {
    NH4ClPtcl nextPtcl = new NH4ClPtcl(_x, _y, 4);
    particles.add(nextPtcl);
  }
  
  // Pass the framecount
  void update(int t) {
    for(int i=0; i<particles.size(); i++){
      particles.get(i).fall(t);
    }
  }
  
  void display() {
    for(int i=0; i<particles.size(); i++){
      particles.get(i).display();
    }
  }


}
