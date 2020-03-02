class Hammer {
  // User input values
  float x, yMax, d;
  // Body parts
  PShape head, shaft;
  // Class constants
  int headHeight = 100, headWidth = 55, shaftWidth = 135;
  
  // Animation values
  boolean newCall;
  int t0;
  float alpha, m;
  
  
  // Construc  tor
  Hammer(float x, float yMax, float d) {
    // Store inputs
    this.x = x; this.yMax = yMax; this.d=d;
    
    // Draw the head
    this.head = createShape();
    this.head.beginShape(QUAD);
      this.head.fill(20);
      this.head.stroke(20);
      this.head.vertex(x-headWidth/2, yMax-d);
      this.head.vertex(x+headWidth/2, yMax-d);
      this.head.vertex(x+headWidth/2, yMax-d-headHeight);
      this.head.vertex(x-headWidth/2, yMax-d-headHeight);
    this.head.endShape(CLOSE);
    
    // Draw the shaft
    this.shaft = createShape();
    this.shaft.beginShape(QUAD);
      this.shaft.fill(168, 165, 165);
      this.shaft.stroke(255);
      this.shaft.vertex(x-shaftWidth/2, yMax-d-headHeight/2);
      this.shaft.vertex(x+shaftWidth/2, yMax-d-headHeight/2);
      this.shaft.vertex(x+shaftWidth/2, -d-headHeight/2);
      this.shaft.vertex(x-shaftWidth/2, -d-headHeight/2);
    this.shaft.endShape(CLOSE);  
    
    // Initialize animation values
    this.t0 = 0;
    this.newCall = true;
    this.alpha = (2*this.d-this.headHeight)/144;
    this.m = (72*this.headHeight-144*this.d)/411;
  }
  
  void strike(int t) {
    if(newCall) {
      this.t0 = t;
      this.newCall = false;
      return;
    }
    int u = t-t0;
    // Specify head and shaft velocity piecewise
    if(u<7) {
      this.shaft.translate(0, this.alpha*u*u);
      this.head.translate(0, this.alpha*u*u);
    }
    else if(u==7){ this.head.translate(0, this.headHeight/2); }
    else if(u==8){ this.head.translate(0, -this.headHeight/2); }
    else if(u<=420){
      this.shaft.translate(0, m); 
      this.head.translate(0, m);
    }
    else{ this.newCall = true; }
  } 


}
