class plate{
  color color1, colorStroke;
  float xPoint, yPoint;

   plate(){
     color1 = color(218, 165, 32);
     colorStroke = color(139, 69, 19);
     xPoint = -600;
     yPoint = 599;
   }
   
   void start(){
     display();
   }
   
   void display(){
     fill(color1);
     stroke(colorStroke);
     rect(xPoint, yPoint, 850, 50, 5, 5, 5, 5);
     xPoint += 1;
     if (xPoint >= 1500){
       xPoint = -600;
     }
   
   }
}
