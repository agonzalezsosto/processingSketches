Circle circ[];

void setup(){
  size(720, 480);
  pixelDensity(2);
  circ = new Circle[10];
  
  for (int i = 0; i < circ.length; i++) {
    circ[i]= new Circle(10, random(40, 100), new PVector(width/2, height/2), random(0.5, 1.4));
  }
}

void draw() {
  background(100);
  for (int i = 0; i < circ.length; i++) {
    circ[i].moveCircles();
  }
}

class Circle {
  
  PVector center; 
  float radius; 
  float speed; 
  int numberOfPoints;
  PVector[] coOrds;
  float interval;
  
  Circle(int nP, float rd, PVector ctr, float sp) {
    numberOfPoints = nP;
    coOrds = new PVector[nP];
    interval = TWO_PI / nP;
    radius = rd;
    center = ctr;
    speed = sp;
    
    for(int i = 0; i < numberOfPoints; i++) { 
      float x = radius * cos(interval * i);
      float y = radius * sin(interval * i);
      coOrds[i] = new PVector(x,y);
    }
  }
  
  void moveCircles() {
  
    if (radius > width/2 || radius < 0) {
      speed *= -1;
    } 
    
    radius += speed;
    
    for(int i = 0; i < numberOfPoints; i++) { 
      float x = radius * cos(interval * i);
      float y = radius * sin(interval * i);
      coOrds[i].x = x  + center.x;
      coOrds[i].y = y  + center.y;
      ellipse(coOrds[i].x, coOrds[i].y, 10, 10);
    }
  }
}
