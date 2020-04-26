class Player{
  ArrayList<Infantry> swords = new ArrayList<Infantry>();
  ArrayList<Archer> bows = new ArrayList<Archer>();
  ArrayList<Cavalry> knights = new ArrayList<Cavalry>();
  
  // This should only be 1 or 2
  int p;
  
  Player(int _p){
    this.p = _p;
    if(p==1) {
      Infantry s1 = new Infantry("a9");
      Infantry s2 = new Infantry("b9");
      Infantry s3 = new Infantry("c9");
      Infantry s4 = new Infantry("d9");
      Infantry s5 = new Infantry("e9");
      Infantry s6 = new Infantry("f9");
      Infantry s7 = new Infantry("g9");
      Infantry s8 = new Infantry("h9");
      Infantry s9 = new Infantry("i9");
      Infantry s10 = new Infantry("j9");
      swords.add(s1);
      swords.add(s2);
      swords.add(s3);
      swords.add(s4);
      swords.add(s5);
      swords.add(s6);
      swords.add(s7);
      swords.add(s8);
      swords.add(s9);
      swords.add(s10);
      
      Archer b1 = new Archer("c10");
      Archer b2 = new Archer("d10");
      Archer b3 = new Archer("e10");
      Archer b4 = new Archer("f10");
      Archer b5 = new Archer("g10");
      Archer b6 = new Archer("h10");
      bows.add(b1);
      bows.add(b2);
      bows.add(b3);
      bows.add(b4);
      bows.add(b5);
      bows.add(b6);
      
      Cavalry k1 = new Cavalry("a10");
      Cavalry k2 = new Cavalry("b10");
      Cavalry k3 = new Cavalry("i10");
      Cavalry k4 = new Cavalry("j10");
      knights.add(k1);
      knights.add(k2);
      knights.add(k3);
      knights.add(k4);
    }
    else if(p==2) {
      Infantry s1 = new Infantry("a2");
      Infantry s2 = new Infantry("b2");
      Infantry s3 = new Infantry("c2");
      Infantry s4 = new Infantry("d2");
      Infantry s5 = new Infantry("e2");
      Infantry s6 = new Infantry("f2");
      Infantry s7 = new Infantry("g2");
      Infantry s8 = new Infantry("h2");
      Infantry s9 = new Infantry("i2");
      Infantry s10 = new Infantry("j2");
      swords.add(s1);
      swords.add(s2);
      swords.add(s3);
      swords.add(s4);
      swords.add(s5);
      swords.add(s6);
      swords.add(s7);
      swords.add(s8);
      swords.add(s9);
      swords.add(s10);
      
      Archer b1 = new Archer("c1");
      Archer b2 = new Archer("d1");
      Archer b3 = new Archer("e1");
      Archer b4 = new Archer("f1");
      Archer b5 = new Archer("g1");
      Archer b6 = new Archer("h1");
      bows.add(b1);
      bows.add(b2);
      bows.add(b3);
      bows.add(b4);
      bows.add(b5);
      bows.add(b6);
      
      Cavalry k1 = new Cavalry("a1");
      Cavalry k2 = new Cavalry("b1");
      Cavalry k3 = new Cavalry("i1");
      Cavalry k4 = new Cavalry("j1");
      knights.add(k1);
      knights.add(k2);
      knights.add(k3);
      knights.add(k4);
    }

  }

  void display() {
    for (Infantry inf : this.swords) {
      inf.display();
    }
    for (Archer arc : this.bows) {
      arc.display();
    }
    for (Cavalry cal : this.knights) {
      cal.display();
    }
  
  }

}
