Bubble[] BubbleStream = new Bubble[100];
Bubble[] bigBubble = new Bubble[8];
int zBound = -600;

Fish2 fish4;

void setup() {
  size(1000, 600, P3D);
  for (int i=0; i < bigBubble.length; i++) {
    bigBubble[i] = new Bubble(random(0,1000), random(600,900),random(-100,-300), int(random(30,50)));
  }
  for (int i=0; i < BubbleStream.length; i++) {
    BubbleStream[i] = new Bubble(random(0,1000), random(600,900),random(-100,-300), 20);
  }
  
  fish4 = new Fish2(500, 300, 300, 100);
  
  frameRate(60);
  
}

void draw() {
  background(20, 96, 136);
  
  for (int i=0; i < BubbleStream.length; i++) {
    BubbleStream[i].smallAscend();
    BubbleStream[i].display();
  }
  for (int i=0; i < bigBubble.length; i++) {
    bigBubble[i].ascend();
    bigBubble[i].display();
  }
  fish4.display();
  
  
  
  
}
