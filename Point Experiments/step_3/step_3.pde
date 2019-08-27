Line[] line;
PVector origin;
float velocity;
float acc;

void setup() {
  size(720, 480);
  pixelDensity(2);
  line = new Line[100];
  for (int i = 0; i < line.length; i++) {
    line[i] = new Line();
  }
  origin = new PVector(width/2, height/2);
  velocity = 1;
  acc = 0.1;
}

void draw() {
  background(0);
   for (int i = 0; i < line.length; i++) {
    line[i].drawLine(origin);
  }
  originShit();
}

void originShit() {
  
  velocity = constrain(velocity + acc, 0, 20);
  origin.x += velocity + noise(velocity);
  origin.y += 3 * noise(origin.x);
  
  if (origin.x > width) {
    origin.x = 0;
    //velocity = 1;
  }
  
  if (origin.y < 0) {
    origin.y = height;
  }
  
  if (origin.y > height) {
    origin.y = 0;
  }
  
}

class Line { 
  
  PVector point;
  float alphaValue;
  
  
  Line() {
    point = new PVector(random(width), random(height));
  }
  
  void drawLine(PVector origin) {
    float distance = dist(point.x, point.y, origin.x, origin.y);
    
    if (distance < 300) { 
      float alpha = 1 - (distance/300.00);
      stroke(255, alpha * 255);
      line(point.x, point.y, origin.x, origin.y);
    }
  }
}
