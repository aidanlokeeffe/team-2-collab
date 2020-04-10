class Button{
  float x, y;
  float dia;
  color buttTextC;
  color buttPressedC;
  color buttEdge = color(255, 255, 255);
  String name;
  
  Button(float x0, float y0, float diameter, int r, int g, int b, String element){
    this.x = x0;
    this.y = y0;
    this.dia = diameter;
    this.buttTextC = color(r, g, b);
    this.buttPressedC = color(255 - r, 255- g, 255 - b);
    this.name = element;
  }

  void display(){
    fill(255, 0, 0);
    stroke(buttEdge);
    //if button pressed change color of circle and remove text
    if (this.overButton() == true & mousePressed == true){
      fill(buttPressedC);
      circle(this.x, this.y, this.dia); 
    }
    else{
      circle(this.x, this.y, this.dia); 
      fill(buttTextC);
      textSize(36);
      text(this.name, this.x - 36, this.y +9);
    }
     
  }
  
  //checks if cursor is over the button
  boolean overButton(){
    float disX = this.x - mouseX;
    float disY = this.y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < this.dia/2){
      return true;
    } else{
      return false;
    }
  
  }
  



}
