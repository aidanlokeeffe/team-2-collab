/*
We're required to use separate tabs for each class
*/

// initializing objects
Engine e1;
conveyorBelt c1;
plate p1;
Steam[] particles = new Steam[50];
Hammer hammer1;
Hammer hammer2;
Hammer hammer3;

int tau;

void setup() {
  size(1500,750);
  background(20, 20, 21);
  
  // create an engine instance and fill particles array with instances of Steam
  e1 = new Engine();
  c1 = new conveyorBelt();
  p1 = new plate();
  for (int i=0; i < particles.length; i++) {
    particles[i] = new Steam(180,400);
  }
  noStroke();
  
  // Hammers
  hammer1 = new Hammer(500, 599, 500);
  hammer2 = new Hammer(800, 599, 500);
  hammer3 = new Hammer(1100, 599, 500);
  
  // Delay: Use this value to control when the hammers start going
  tau = 90;
  
  
  
  
}

  


void draw() {
  background(20, 20, 21);
  frameRate(60); 
  p1.start();
  e1.start();
  c1.start();

  for (int i=0; i < particles.length; i++) {
    particles[i].move();
    particles[i].display();
  }
  if(frameCount > 3*tau){
    hammer1.strike(frameCount - tau);
    hammer2.strike(frameCount - 2*tau);
    hammer3.strike(frameCount - 3*tau);
  }
  else if(frameCount > 2*tau){
    hammer1.strike(frameCount - tau);
    hammer2.strike(frameCount - 2*tau);
  }
  else if(frameCount > tau){
    hammer1.strike(frameCount - tau);
  }
  shape(hammer1.head); shape(hammer1.shaft);
  shape(hammer2.head); shape(hammer2.shaft);
  shape(hammer3.head); shape(hammer3.shaft);
  

}
