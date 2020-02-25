class Engine {
  float a;
  
  Engine() {}
  
  // starts the animation
  void start() {
    display();
  }
  
  // displays engine and animates vibrations using small rotations
  void display() {
    background(69, 65, 65);
    
    // finds time and only vibrates whole engine on even seconds
    if (second() % 2 == 0) {  
    a = random(-0.02, 0.02);
  }
    // vibrates entire engine
    pushMatrix();
    translate(0, 0);
    rotate(a);
    stroke(255);
    fill(168, 165, 165);
    
    // vibrates exhaust pipe separately from engine but still coincides with engine
    // vibrations
    pushMatrix();
    translate(87,0);
    rotate(random(-.01,.01));
    beginShape();
    vertex(75,500);
    vertex(100,500);
    vertex(115,400);
    vertex(60,400);
    endShape(CLOSE);
    popMatrix();
    
    // draws entire engine
    beginShape();
    vertex(0,750);
    vertex(300,750);
    vertex(300,600);
    vertex(200,500);
    vertex(0,500);
    endShape(CLOSE);
    fill(130, 130, 127);
    beginShape();
    vertex(0,750);
    vertex(0,650);
    vertex(50,650);
    endShape(CLOSE);
    beginShape();
    vertex(40,750);
    vertex(90,650);
    vertex(130,650);
    vertex(80,750);
    endShape(CLOSE);
    beginShape();
    vertex(120,750);
    vertex(170,650);
    vertex(210,650);
    vertex(160,750);
    endShape(CLOSE);
    beginShape();
    vertex(200,750);
    vertex(250,650);
    vertex(290,650);
    vertex(240,750);
    endShape(CLOSE);
    fill(255, 252, 51);
    beginShape();
    vertex(0,750);
    vertex(50,650);
    vertex(90,650);
    vertex(40,750);
    endShape(CLOSE);
    beginShape();
    vertex(80,750);
    vertex(130,650);
    vertex(170,650);
    vertex(120,750);
    endShape(CLOSE);
    beginShape();
    vertex(160,750);
    vertex(210,650);
    vertex(250,650);
    vertex(200,750);
    endShape(CLOSE);
    beginShape();
    vertex(240,750);
    vertex(300,750);
    vertex(300,650);
    vertex(290,650);
    endShape(CLOSE);
    popMatrix();
  }
}
