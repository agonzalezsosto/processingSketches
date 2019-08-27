class Particle { 
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  int rCount = 0;
  int gCount = 4;
  int bCount = 20;
  float rot = 0.0;
  
  Particle(PVector initialPosition, PVector initialVelocity, PVector initialAcceleration) { 
    position = initialPosition;
    velocity = initialVelocity;
    acceleration = initialAcceleration;
  }
  
  void update(){
    velocity.add(acceleration);
    velocity.limit(10);
    position.add(velocity);
    
    checkEdges();
  }
  
  void checkEdges() { 
    if (position.x < 0) { 
      position.x = width;
    }
    
    if (position.x > width) {
      position.x = 0;
    }
    
    if (position.y < 0) {
      position.y = height;
    }
    
    if (position.y > height) {
      position.y = 0;
    }
  }
  
  void draw() {
    
    rCount = (rCount + 3) % 255;
    gCount = (gCount + 4) % 255;
    bCount = (bCount + 1) % 255;
    rot += 0.01;
    
    pushMatrix();
      
      translate(position.x, position.y);
      rotate(rot);
      stroke(rCount, gCount, bCount, 10);
      fill(rCount, gCount, bCount, 50);
      ellipse(0, 0, 10, 10);
    popMatrix();
  }
}
