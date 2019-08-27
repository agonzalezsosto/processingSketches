Vehicle[] v = new Vehicle[1];
float offset = 0;

void setup() { 
  size(720, 480);
  pixelDensity(2);
 
  for(int i = 0; i < v.length; i++) {
     v[i] = new Vehicle(random(width), random(height));
  }
  
 
} 

void draw() {
  background(255);
  fill(100);
  
  offset += 0.1;
  float radius = 200;
  float x = (width/2) + radius * cos(offset *(PI/10));
  float y = (height/2) + radius * sin(offset *(PI/10));
  
  //println(frameRate);
  ellipse(x, y, 10, 10);
  PVector mouse = new PVector(x, y);
  for(int i = 0; i < v.length; i++) {
     v[i].steering(mouse);
     v[i].update();
     v[i].display();
  }
}

class Vehicle { 
  
  PVector location; 
  PVector velocity; 
  PVector acceleration; 
  float maxSpeed;
  float maxForce;
  float r;
  
  Vehicle(float x, float y) { 
    acceleration = new PVector(0,0);
    velocity = new PVector(0, -2);
    location = new PVector(x,y);
    r = 6; 
    maxSpeed = 7; 
    maxForce = 0.5;
  }
  
  void update() { 
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void steering(PVector target) { 
    PVector desired = PVector.sub(target, location);
    
    float d = desired.mag(); 
    if (d < 100) { 
      float m = map(d, 0, 100, 0, maxSpeed);
      desired.setMag(m);
    } else { 
      desired.setMag(maxSpeed);
    }

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  void applyForce(PVector force) { 
    acceleration.add(force);
  }
  
    void display() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + PI/2;
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
    
    
  }
  
}
