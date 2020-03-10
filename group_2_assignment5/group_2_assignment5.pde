Bubble b1;
Bubble b2;
Bubble b3;
int zBound = -600;

Fish2 fish4;

void setup() {
  size(1000, 600, P3D);
  b1 = new Bubble(100,600,0);
  b2 = new Bubble(900,600,0);
  b3 = new Bubble(300,600,0);
  
  fish4 = new Fish2(500, 300, 300, 100);
  
  frameRate(60);
  
}

void draw() {
  background(20, 96, 136);
  
  b1.ascend();
  b2.ascend();
  b3.ascend();
  b1.display();
  b2.display();
  b3.display();
  
  fish4.display();
  
  
  
  
}
