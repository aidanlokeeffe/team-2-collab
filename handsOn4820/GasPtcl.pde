class GasPtcl {
  float x, y;
  float variance;
  PVector velocity;
  
  GasPtcl(float x0, float y0, float _var) {
    this.x = x0;
    this.y = y0;
    this.variance = _var;
    this.velocity = getVelocity(variance);
  }
  
  PVector getVelocity(float _var) {
    float vx0 = randomGaussian()*_var;
    float vy0 = randomGaussian()*_var;
    return new PVector(vx0, vy0);
  }
  
  void motion() {
    boolean constrainX = abs(this.x - width/2) >= width/2;
    int xPow = (constrainX) ? 1 : 0;
    this.velocity.x *= pow(-1, xPow);
    
    boolean constrainY = abs(this.y - height/2) >= height/2;
    int yPow = (constrainY) ? 1 : 0;
    this.velocity.y *= pow(-1, yPow);
    
    this.x += this.velocity.x;
    this.y += this.velocity.y;
  }
  
  // Must be defined in child class
  void display() {}






}
