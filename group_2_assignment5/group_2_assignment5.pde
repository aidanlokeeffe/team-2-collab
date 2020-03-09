Bubble b1;
Bubble b2;
Bubble b3;


void setup() {
  size(1000, 600, P3D);
  b1 = new Bubble(100,600,0);
  b2 = new Bubble(900,600,0);
  b3 = new Bubble(300,600,0);
  
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
  
  
  
  
}
