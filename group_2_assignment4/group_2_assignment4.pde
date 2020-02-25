Engine e1;

void setup() {
  size(1500,750);
  background(69, 65, 65);
  e1 = new Engine();
  rectMode(CENTER);
  noStroke();
}

void draw() {
  e1.start();
}
/*
We're required to use separate tabs for each class
*/
