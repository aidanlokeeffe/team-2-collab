class conveyorBelt{
  color color1, color2, colorstroke1, colorstroke2;
  float r;

  
  conveyorBelt(){
    color1 = color(168, 165, 165);
    colorstroke1 = color(0, 0, 0);
    color2 = color(69, 65, 65);
    colorstroke2 = color(0,0,0);
    r = .25;
  }
  
  void start(){
    display();
  }
  
  void display(){
    
    //Draw the belt
    pushMatrix();
    
    fill(color1);
    stroke(colorstroke1);
    beginShape();
    vertex(350, 650);
    vertex(1400, 650);
    //start of curve
    curveVertex(1400, 650);
    curveVertex(1400, 650);
    //the curve
    curveVertex(1415,660);
    curveVertex(1420, 675);
    curveVertex(1415, 690);
    //end of curve
    curveVertex(1400, 700);
    curveVertex(1400, 700);
    vertex(1400, 700);
    vertex(350, 700);
    //start of curve
    curveVertex(350, 700);
    curveVertex(350, 700);
    //the curve
    curveVertex(335, 690);
    curveVertex(330, 675);
    curveVertex(335, 660);
    //end of curve
    curveVertex(350, 650);
    curveVertex(350, 650); 
    endShape(CLOSE);
    popMatrix();
    
    r+= .25;
    r %= TWO_PI;
    pushMatrix();
    fill(color2);
    stroke(colorstroke2);
    pushMatrix();
    translate(360, 675);
    rotate(r);
    circle(0, 0, 30);
    popMatrix();
    
    pushMatrix();
    translate(875, 675);
    rotate(r);
    circle(0, 0, 30);
    popMatrix();
    
    pushMatrix();
    translate(1390, 675);
    rotate(r);
    circle(0, 0, 30);
    popMatrix();
    
    popMatrix();
  
  }
  
}
