PImage[] makeSprite(String nameStr, int len, String imgType) {
  PImage[] outArray = new PImage[len]; 
  for(int i=0; i<len; i++) {
    String imgName = nameStr + nf(i) + imgType;
    outArray[i] = loadImage(imgName);
  } 
  return outArray;
}
public PImage[] NH3_sprite = new PImage[2];
public PImage[] HCl_sprite = new PImage[6];

NH3Ptcl test;
HClPtcl test2;

NH3Gas test3;
HClGas test4;



void setup() {
  size(1000, 600);
  background(0);
  frameRate(12);
  
  // Create the sprites
  NH3_sprite = makeSprite("NH3_", 2, ".png");
  HCl_sprite = makeSprite("HCl_", 6, ".png");  
  
  test = new NH3Ptcl(100, 100, 10, 2);
  test2 = new HClPtcl(100, 100, 10, 6);
  
  test3 = new NH3Gas(100, 300, 10, 2);
  test4 = new HClGas(900, 300, 10, 2);
}

void draw() {
  background(0);
  
  /*image(NH3_sprite[frameCount%2], 100, 200);
  
  image(HCl_sprite[frameCount%6], 900, 200);
  
  /*test.motion();
  test.display();
  
  test2.motion();
  test2.display();*/
  
  test3.injectGas();
  test3.update();
  test3.display();
  
  test4.injectGas();
  test4.update();
  test4.display();

}
