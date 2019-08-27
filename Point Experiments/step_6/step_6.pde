Line[] line;

ArrayList<Origin> origin = new ArrayList<Origin>();

void setup() {
  size(1080, 720);
  pixelDensity(2);
  line = new Line[100];
  origin.add(new Origin());
  
  for (int i = 0; i < line.length; i++) {
    line[i] = new Line();
  }
  
  for (int i = 0; i < 1; i++) {
    origin.add(new Origin());
  }
  
}

void draw() {
  background(0);
   for (int i = 0; i < line.length; i++) {
     for(int j = 0; j < origin.size(); j++) {
       line[i].drawLine(origin.get(j).origin);
     }
  }
  
 for(int j = 0; j < origin.size(); j++) {
   origin.get(j).originShit();
 }
 
 //saveFrame("####-creepyShit.png");
  
}

void mousePressed(){
  origin.add(new Origin());
}

class Line { 
  
  PVector point;
  float alphaValue;
  PVector random;
  
  
  Line() {
    point = new PVector(random(width), random(height));
    random = new PVector(random(-0.01, 0.01), random(-0.01, 0.01));
  }
  
  void drawLine(PVector origin) {
    float distance = dist(point.x, point.y, origin.x, origin.y);
    
    if (distance < 100) { 
      float alpha = 1 - (distance/100.00);
      stroke(255, alpha * 255);
      line(point.x, point.y, origin.x, origin.y);
      fill(255, alpha * 255);
      ellipse(point.x, point.y, 5, 5);
    }
    point.add(random);
    
    if (point.x < 0) {
      point.x = width;
    }
    
    if (point.x > width) {
      point.x = 0;
    }
    
    if (point.y < 0) {
      point.y = height;
    }
    
    if (point.y > height) {
      point.y = 0;
    }
    
    
  }
}

class Origin { 
  
  PVector origin;
  float velocity;
  float acc;

  Origin() { 
    origin = new PVector(random(width), random(height));
    velocity = 1;
    acc = random(-0.1, 0.1);
    
  }
  
  void originShit() {
  
  velocity += acc;//constrain(velocity + acc, 0, 10);
  origin.x += velocity;
  origin.y += 3 * noise(origin.x);
  ellipse(origin.x, origin.y, 3, 3);
  
  if (origin.x > width) {
    origin.x = 0;
  }
  
  if (origin.y < 0) {
    origin.y = height;
  }
  
  if (origin.y > height) {
    origin.y = 0;
  }
  
  if (velocity > 10 || velocity < 0) {
    acc *= -1;
  }
} 
} 
