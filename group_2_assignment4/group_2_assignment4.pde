/*
We're required to use separate tabs for each class
*/

// initializing objects
Engine e1;
conveyorBelt c1;
plate p1;
Steam[] particles = new Steam[50];

void setup() {
  size(1500,750);
  background(69, 65, 65);
  
  // create an engine instance and fill particles array with instances of Steam
  e1 = new Engine();
  c1 = new conveyorBelt();
  p1 = new plate();
  for (int i=0; i < particles.length; i++) {
    particles[i] = new Steam(180,400);
  }
  noStroke();
}


void draw() {
  e1.start();
  p1.start();

  if(p1.xPoint != 450){
      c1.start();
  }
 else if (p1.xPoint == 450){
    c1.stop();
  }
  for (int i=0; i < particles.length; i++) {
    particles[i].move();
    particles[i].display();
  }
  

}
