//This is actually gonna be two fish 
class Fish2 {
  float x, y, z, r;
  PShape fish1, fish2;
  
  Fish2(float x, float y, float z, float r) {
    this.x = x; this.y = y; this.z = z;
    this.r = r;
    
    pushMatrix();
    translate(x + r, y, z);
    this.fish1 = loadShape("data/GoldenFish.obj");
    this.fish1.scale(16);
    this.fish1.rotate(PI, 0, 0, 1);
    this.fish1.rotateY(PI);
    popMatrix();
    
    pushMatrix();
    translate(x - r, y, z);
    this.fish2 = loadShape("data/GoldenFish.obj");
    this.fish2.scale(16);
    this.fish2.rotate(PI, 0, 0, 1);
    this.fish2.rotateY(PI);
    popMatrix();
    
  
  }

  void display() {
    this.swim();
    
    pushMatrix();
    translate(x + r, y, z);
    shape(this.fish1);
    popMatrix();
    
    pushMatrix();
    translate(x - r, y, z);
    shape(this.fish2);
    popMatrix();
  }
  
  void swim() {
    float angle = min(pow(frameCount*PI, 1.1)/10000, 3*PI);
    
    pushMatrix();
    this.fish1.translate(0, 0, -1);
    this.fish2.translate(0, 0, -1);
    
    pushMatrix();
    this.fish1.rotate(angle, 0, 0, 1);
    popMatrix();
    
    pushMatrix();
    this.fish2.rotate(-angle, 0, 0, 1);
    popMatrix();
    popMatrix();
    
    if(frameCount%2000 == 0){
      pushMatrix();
      this.fish1.translate(0, 0, 2000);
      this.fish2.translate(0, 0, 2000);
      
    } 
  }
}
