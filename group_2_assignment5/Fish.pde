import java.lang.Math;

class Fish {
  float x, y, z, x0, y0, z0, vx, vy, vz;
  float rho, theta, phi;
  PShape body;
  
  Fish(float _x, float _y, float _z, float _vx, float _vy, float _vz) {
    // Moving coordinates
    this.x = _x; this.y = _y; this.z = _z;
    // Initial coordinates
    this.x0 = _x; this.y0 = _y; this.z0 = _z;
    // Components of velocity
    this.vx = _vx; this.vy = _vy; this.vz = _vz;
    
    pushMatrix();
    translate(this.x0, this.y0, this.z0);
    this.body = loadShape("data/GoldenFish.obj");
    this.body.scale(16);
    
    // Default orientation of fish, (0, 0, 1);
    this.body.rotate(PI, 0, 0, 1); /* rotateZ cannot be applied to a PShape, only to 
    the world's coordinate system. This is a workaround */
    popMatrix();
    
    // Orient fish in direction of its velocity
    // First, get spherical coordinates
    rho = sqrt(pow(this.vx, 2) + pow(this.vy, 2) + pow(this.vz, 2));
    theta = atan(this.vx/this.vz);
    phi = acos(this.vy/rho);
    
    // Now that we have phi and theta, rotate the fish
    // This is in terms of the world coordinates
    pushMatrix();
    rotateY(theta);
    rotateX(phi);
    popMatrix();
    
    
  }
  
  // Fish drawing function
  void display() {
    this.swim();
    
    pushMatrix();
    translate(this.x, this.y, this.z);
    rotateY(-PI+theta);
    rotateX(phi-PI/2);
    shape(this.body);
    popMatrix();
  }
  
  // Fish animation function
  void swim() {
    this.x += this.vx;
    this.y += this.vy;
    this.z += this.vz;
    
    // Bounds on motion
    if(x > width) {x = 1;} else if (x < 0) {x = width-1 ;}
    if(y > height) {y = 1;} else if (y < 0) {y = height-1 ;}
    //if(z < zBound) {z = 0;} else if (z > 0) {z = zBound+1;}
  }
  
  













}
