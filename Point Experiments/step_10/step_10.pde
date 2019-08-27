Line[] line;
Circle[] circ;

void setup() {
  size(720, 480);
  pixelDensity(2);
  line = new Line[100];
  circ = new Circle[6];
  
  
  for (int i = 0; i < line.length; i++) {
    line[i] = new Line();
  } 
  
  for (int i = 0; i < circ.length; i++) {
    circ[i] = new Circle((int)random(5,30), random(4, 100), new PVector(width/2, height/2), random(0.5, 4));
  }
  
}

void draw() {
  background(0);
  
   for (int i = 0; i < line.length; i++) {
     for (int z = 0; z < circ.length; z++) {
       for(int j = 0; j < circ[z].numberOfPoints; j++) {
       line[i].drawLine(circ[z].coOrds[j], circ[z].radius);
       }
     }
  }
  
 for (int z = 0; z < circ.length; z++) {
    circ[z].moveCircles();
 }
  

 
//saveFrame("#####-n2.png");
  
}

class Line { 
  
  PVector point;
  float alphaValue;
  PVector random;
  boolean metTotal;
  int total;
  int currentLines;
  
  Line() {
    point = new PVector(random(width), random(height));
    random = new PVector(random(-0.02, 0.02), random(-0.02, 0.02));
    total = 4;
    currentLines = 0;
  }
  
  void drawLine(PVector origin, float r) {
    float distance = dist(point.x, point.y, origin.x, origin.y);
   
   if (currentLines < 1000) { 
    if (r > width/4) {
      if (distance < 150) { 
      float alpha = 1 - (distance/150.00);
      stroke(255, alpha * 255);
      line(point.x, point.y, origin.x, origin.y);
      currentLines++;
   } }else {
      if (distance < 150) { 
      float alpha = 1 - (distance/150.00);
      stroke(255, alpha * 255);
      line(point.x, point.y, origin.x, origin.y);
      currentLines++;
    } 
   
   }
   } else { 
      currentLines--;
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

class Circle {
  
  PVector center; 
  float radius; 
  float speed; 
  int numberOfPoints;
  PVector[] coOrds;
  float interval;
  float sum;
  
  Circle(int nP, float rd, PVector ctr, float sp) {
    numberOfPoints = nP;
    coOrds = new PVector[nP];
    interval = TWO_PI / nP;
    radius = rd;
    center = ctr;
    speed = sp;
    sum = 0;
    
    for(int i = 0; i < numberOfPoints; i++) { 
      float x = radius * cos(interval * i);
      float y = radius * sin(interval * i);
      coOrds[i] = new PVector(x,y);
    }
  }
  
  void moveCircles() {
  
    if (radius < 0 || radius > width) {
      speed *= -1;
    } 
    
    sum += 0.01;
    //speed += 0.01;
    radius -= speed;
    
    for(int i = 0; i < numberOfPoints; i++) { 
      float x = radius * cos(interval * i) ;
      float y = radius * sin(interval * i);
      coOrds[i].x = x  + center.x + (10 * cos(sum) * i);
      coOrds[i].y = y  + center.y + (10 * sin(sum) * i);
      ellipse(coOrds[i].x, coOrds[i].y, 6, 6);
      stroke(255,255);
      line(coOrds[constrain(i-1, 0, numberOfPoints)].x, coOrds[constrain(i-1, 0, numberOfPoints)].y, coOrds[i].x, coOrds[i].y);
      noFill();
      stroke(255, 10);
      //ellipse(center.x, center.y, radius * 2, radius *2);
    }
  }
}
