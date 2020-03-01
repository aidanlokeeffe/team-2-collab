class Engine {
  float a, theta, transitionRate;
  color color1,color2;
  
  Engine() {
    color1 = color(176, 2, 2);
    color2 = color(69,65,65);
    theta = 0.0;
    transitionRate = .01;
  }
  
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
    
    // vibrates exhaust pipe in addition to engine vibrations
    // uses nested push and pop matrix functions
    pushMatrix();
    translate(87,0);
    rotate(random(-.02,.02));
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
    fill(0);
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
    //fill(255, 252, 51);
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
    
    // heats furnace periodically by transitioning between two colors
    this.heat();
    ellipse(175, 575, 75, 75);
    popMatrix();
  }
  
  // uses sine curve and linear interpolation function to transition
  void heat() {
    fill(lerpColor(color1, color2, (sin(theta += transitionRate) + 1.0) / 2.0));
  }
}
