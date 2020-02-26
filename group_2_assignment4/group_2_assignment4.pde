Engine e1;
Steam[] particles = new Steam[50];

void setup() {
  size(1500,750);
  background(69, 65, 65);
  e1 = new Engine();
  for (int i=0; i < particles.length; i++) {
    particles[i] = new Steam(180,400);
  }
  noStroke();
}

void draw() {
  e1.start();
  for (int i=0; i < particles.length; i++) {
    particles[i].move();
    particles[i].display();
  }
}
/*
We're required to use separate tabs for each class
*/
