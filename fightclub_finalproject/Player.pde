class Player{
  ArrayList<Infantry> swords = new ArrayList<Infantry>();
  ArrayList<Archer> bows = new ArrayList<Archer>();
  ArrayList<Cavalry> knights = new ArrayList<Cavalry>();

  // 0: Player 1;
  // 1: Player 2
  int p;
  
  boolean moved;
  
  

  Player(int _p){
    this.p = _p;
    if(p==0) {
      // Create infantry
      for(int i=97; i<107; i++) {
        char col = (char) i;
        String place = col + "9";
        Infantry next = new Infantry(place, p);
        swords.add(next);
      }

      // Create archers
      for(int i=99; i<105; i++) {
        char col = (char) i;
        String place = col + "10";
        Archer next = new Archer(place, p);
        bows.add(next);
      }

      // Create cavalry
      for(int i=0; i<2; i++) {
        char col1 = (char) (97 + i);
        String place1 = col1 + "10";
        char col2 = (char) (105 + i);
        String place2 = col2 + "10";
        Cavalry next1 = new Cavalry(place1, p);
        knights.add(next1);
        Cavalry next2 = new Cavalry(place2, p);
        knights.add(next2);
      }
    }
    else if(p==1) {
      // Create infantry
      for(int i=97; i<107; i++) {
        char col = (char) i;
        String place = col + "2";
        Infantry next = new Infantry(place, p);
        swords.add(next);
      }

      // Create archers
      for(int i=99; i<105; i++) {
        char col = (char) i;
        String place = col + "1";
        Archer next = new Archer(place, p);
        bows.add(next);
      }

      // Create cavalry
      for(int i=0; i<2; i++) {
        char col1 = (char) (97 + i);
        String place1 = col1 + "1";
        char col2 = (char) (105 + i);
        String place2 = col2 + "1";
        Cavalry next1 = new Cavalry(place1, p);
        knights.add(next1);
        Cavalry next2 = new Cavalry(place2, p);
        knights.add(next2);
      }

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
  
  boolean hasMoved() {
    return moved;
  }
  
  // Returns true if all the units are not alive, and false otherwise
  boolean lost() {
    boolean myArmyIsNoMore = true;
    for(Infantry inf : this.swords) {
      myArmyIsNoMore = myArmyIsNoMore && ! inf.alive;
    }
    for(Archer arc : this.bows) {
      myArmyIsNoMore = myArmyIsNoMore && ! arc.alive;
    }
    for(Cavalry horsey : this.knights) {
      myArmyIsNoMore = myArmyIsNoMore && ! horsey.alive;
    }
    return myArmyIsNoMore;
    
  
  }

}
