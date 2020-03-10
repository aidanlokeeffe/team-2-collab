Bubble b1;
Bubble b2;
Bubble b3;
int zBound = -600;

Fish fish1;
Fish fish2;
Fish fish3;

void setup() {
  size(1000, 600, P3D);
  b1 = new Bubble(100,600,0);
  b2 = new Bubble(900,600,0);
  b3 = new Bubble(300,600,0);
  fish1 = new Fish(500, 300, 0, 5, -1, -4);
  fish2 = new Fish(400, 200, -1000, 1, 0, 2);
  fish3 = new Fish(300, 200, 0, 0, 0, 2);
  
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
  
  fish1.display();
  fish2.display();
  fish3.display();
  
  
  
  
}
