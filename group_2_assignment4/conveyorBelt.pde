class conveyorBelt{
  color color1, color2, colorstroke1, colorstroke2;
  float r;
  color backgroundColor = color(69, 65, 65);
  float topY, bottomY, movement;

  
  conveyorBelt(){
    color1 = color(168, 165, 165);
    colorstroke1 = color(0, 0, 0);
    color2 = color(69, 65, 65);
    colorstroke2 = color(0,0,0);
    r = .25;
    topY = 650;
    bottomY = 700;
    movement = 0;
  }
  
  void start(){
    display();
  }
  
  void display(){
    
    //Draw the belt
    pushMatrix();
    strokeWeight(2);
    
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
    strokeWeight(1);
    popMatrix();
    
    pushMatrix();
    stroke(colorstroke1);
    strokeWeight(2);
    for(int i = 375; i < 1400; i+= 25){
      line(i - 25 + movement, topY, i + movement, bottomY);
    }
    movement += 1;
    if (movement == 26){
      movement =0;
    }
    popMatrix();
    strokeWeight(1);
    
    r+= .25;
    r %= TWO_PI;
    pushMatrix();
    strokeWeight(2);
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
    
    strokeWeight(1);
    popMatrix();
  
  }
  
  
  void stop(){
        
    //Draw the belt
    pushMatrix();
    strokeWeight(2);
    
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
    strokeWeight(1);
    popMatrix();
    
    pushMatrix();
    stroke(colorstroke1);
    strokeWeight(2);
    for(int i = 375; i < 1400; i+= 25){
      line(i - 25 + movement, topY, i + movement, bottomY);
    }
    movement += 0;
    if (movement == 26){
      movement =0;
    }
    popMatrix();
    strokeWeight(1);
    
    pushMatrix();
    strokeWeight(2);
    fill(color2);
    stroke(colorstroke2);
    pushMatrix();
    translate(360, 675);
    circle(0, 0, 30);
    popMatrix();
    
    pushMatrix();
    translate(875, 675);
    circle(0, 0, 30);
    popMatrix();
    
    pushMatrix();
    translate(1390, 675);
    circle(0, 0, 30);
    popMatrix();
    
    strokeWeight(1);
    popMatrix();
  
  }
}
