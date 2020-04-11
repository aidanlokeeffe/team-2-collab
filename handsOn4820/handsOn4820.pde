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
public PImage[] NH4Cl_sprite = new PImage[4];

boolean mPressed = false;

NH3Gas reactant1;
HClGas reactant2;



Button NH3Button;
Button HCLButton;

void setup() {
  size(1000, 600);
  background(0);
  frameRate(18);
  
  // Create the sprites
  NH3_sprite = makeSprite("NH3_", 2, ".png");
  HCl_sprite = makeSprite("HCl_", 6, ".png");  
  NH4Cl_sprite = makeSprite("NH4Cl_", 4, ".png");
  
  reactant1 = new NH3Gas(100, 300, 10, 6);
  reactant2 = new HClGas(900, 300, 10, 6);
  

  
  NH3Button = new Button(100, 300, 100, 234, 255, 0, "NH3");
  HCLButton = new Button(900, 300, 100, 0, 162, 8, "HCl");
}

void draw() {
  background(0);
  
  NH3Button.display();
  HCLButton.display();
  
  //if mouse is pressed and over right button it will release
  //the corresponding gas
  if (mPressed){
    if(NH3Button.overButton()){
        reactant1.injectGas();
    }
    if(HCLButton.overButton()){
        reactant2.injectGas();
    }
  }

  reactant1.collides();
  reactant1.update();
  reactant1.display();

  reactant2.collides();
  reactant2.reacts(reactant1);
  reactant2.update();
  reactant2.display();
  
  

}

//these just toggle the boolean mouse pressed var
void mousePressed(){
  mPressed = true;
}
void mouseReleased(){
  mPressed = false;
}
