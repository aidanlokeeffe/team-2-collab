/*
We're required to use separate tabs for each class
*/

// initializing objects
Engine e1;
Steam[] particles = new Steam[50];
Hammer hammer1;

void setup() {
  size(1500,750);
  background(69, 65, 65);
  
  // create an engine instance and fill particles array with instances of Steam
  e1 = new Engine();
  for (int i=0; i < particles.length; i++) {
    particles[i] = new Steam(180,400);
  }
  noStroke();
  
  // Test hammer
  hammer1 = new Hammer(500, 500, 300);
  
  
}

  


void draw() {
  frameRate(60); 
  e1.start();
  for (int i=0; i < particles.length; i++) {
    particles[i].move();
    particles[i].display();
  }
  hammer1.strike(frameCount);
  shape(hammer1.head); shape(hammer1.shaft);
  
  
  
}
