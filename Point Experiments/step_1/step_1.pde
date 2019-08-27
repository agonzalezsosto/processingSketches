PVector ballOne;
float acceleration;
float velocity;

PVector[] pointOne;


void setup() {
  size(720, 480);
  ballOne = new PVector(0,height/2);
  acceleration = 0.1;
  velocity = 1;
  pointOne = new PVector[15];
  
  for (int i = 0; i < 15; i++) {
    pointOne[i] = new PVector(random(width), random(height));
  }
  
}

void draw() {
  background(100);
  if (ballOne.x > width) {
    ballOne.x = 0;
    velocity *= -1;
  }
  
  velocity += acceleration;
  ballOne.x += velocity;
  
  fill(0);
  ellipse(ballOne.x, ballOne.y, 1, 1);
  
  for (int i = 0; i < pointOne.length; i++) {
    
    
    ellipse(pointOne[i].x, pointOne[i].y, 1, 1);
    line(ballOne.x, ballOne.y, pointOne[i].x, pointOne[i].y);
  }
  
  
  
}
