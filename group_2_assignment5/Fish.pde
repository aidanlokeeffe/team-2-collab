class Fish {
  float x, y, z, x0, y0, z0;
  PShape body;
  
  Fish(float _x, float _y, float _z) {
    // Moving coordinates
    this.x = _x;
    this.y = _y;
    this.z = _z;
    // Initial coordinates
    this.x0 = _x;
    this.y0 = _y;
    this.z0 = _z;
    
    this.body = loadShape("data/GoldenFish.obj");
  }
  
  void display() {
  
  
  }
  
  













}
