Bubble b1;
Bubble b2;
Bubble b3;
PShape myCube;

void setup() {
  size(1000, 600, P3D);
  b1 = new Bubble(100,600,0);
  b2 = new Bubble(900,600,0);
  b3 = new Bubble(300,600,0);
  //translate(400, 250, 0);
  //fill(255, 0, 0);
  //myCube = createShape(BOX, 150);
  //myCube.rotateY(PI/4);
  //myCube.rotateX(PI/4);
  //camera(-400, 0, -100, 0, 0, 0, 0, 1, 0);
}

void draw() {
  background(20, 96, 136);
  b1.ascend();
  b2.ascend();
  b3.ascend();
  b1.display();
  b2.display();
  b3.display();
  //shape(myCube);
  //if(frameCount < 1000){
    //myCube.rotateY(100/pow(frameCount, 0.9));
    //if(frameCount%100 == 1){
      //println(100/(pow(frameCount, 0.9)));
    //}
  //}
  //else{
    //myCube.rotateX(pow(2, frameCount/1800));
    //if(frameCount%100 == 1){
      //println(pow(2, frameCount/300));
    //}
  //}
}
