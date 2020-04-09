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

boolean mPressed = false;

NH3Gas test3;
HClGas test4;

Button NH3Button;
Button HCLButton;

void setup() {
  size(1000, 600);
  background(0);
  frameRate(12);
  
  // Create the sprites
  NH3_sprite = makeSprite("NH3_", 2, ".png");
  HCl_sprite = makeSprite("HCl_", 6, ".png");  
  
  test3 = new NH3Gas(100, 300, 10, 2);
  test4 = new HClGas(900, 300, 10, 2);
  
  NH3Button = new Button(100, 300, 100, 234, 255, 0, "NH3");
  HCLButton = new Button(900, 300, 100, 0, 162, 8, "HCL");
}

void draw() {
  background(0);
  
  NH3Button.display();
  HCLButton.display();
  
  //if mouse is pressed and over right button it will release
  //the corresponding gas
  if (mPressed){
    if(NH3Button.overButton()){
        test3.injectGas();
    }
    if(HCLButton.overButton()){
        test4.injectGas();
    }
  }

  test3.collides();
  test3.update();
  test3.display();

  test4.collides();
  test4.update();
  test4.display();

}

//these just toggle the boolean mouse pressed var
void mousePressed(){
  mPressed = true;
}
void mouseReleased(){
  mPressed = false;
}
