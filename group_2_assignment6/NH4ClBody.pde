class NH4ClBody {
  ArrayList<NH4ClPtcl> particles = new ArrayList<NH4ClPtcl>();
  
  NH4ClBody(){}
  
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
