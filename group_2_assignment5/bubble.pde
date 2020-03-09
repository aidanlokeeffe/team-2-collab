//class can display a light blue sphere and includes a method for ascending the
// instance to the top of the screen

class Bubble {
  float x, y, z, x0, y0, z0;
  PShape Sphere;
  
  Bubble(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
    /*this.x0 = x0;
    this.y0 = y0;
    this.z0 = z0;*/
    noStroke();
    fill(197, 234, 250, 150);
    Sphere = createShape(SPHERE, 70);
  }
  
  void display() {
    if (frameCount == 1) {
      x0 = x;
      y0 = y;
      z0 = z;
    }
    lights();
    pushMatrix();
    translate(this.x, this.y, this.z);
    shape(Sphere);
    popMatrix();
  }
  
  void ascend() {
    if (this.y < -70) {
      this.x = this.x0;
      this.y = this.y0;
      this.z = this.z0;
    }
    this.x += random(-2,2);
    this.y += random(-4,-1);
    this.z += random(-1,1);
  }
}
