PShape mySphere;
PShape myCube;

void setup() {
  size(900, 700, P3D);

  translate(400, 250, 0);
  mySphere = createShape(SPHERE, 100);
  fill(255, 0, 0);
  myCube = createShape(BOX, 150);
  myCube.rotateY(PI/4);
  myCube.rotateX(PI/4);
  camera(-400, 0, -100, 0, 0, 0, 0, 1, 0);
}

void draw() {
  background(20, 96, 136);
  //shape(mySphere);
  shape(myCube);
  if(frameCount < 1000){
    myCube.rotateY(100/pow(frameCount, 0.9));
    if(frameCount%100 == 1){
      println(100/(pow(frameCount, 0.9)));
    }
  }
  else{
    myCube.rotateX(pow(2, frameCount/1800));
    if(frameCount%100 == 1){
      println(pow(2, frameCount/300));
    }
  }
}
