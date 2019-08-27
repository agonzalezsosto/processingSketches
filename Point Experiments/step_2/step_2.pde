PVector pointOne;
PVector pointTwo;

void setup() {
  size(720, 480);
  
  pointOne = new PVector(width/2, height/2);
  pointTwo = new PVector(random(width), random(height));
  
}

void draw() {
  background(100);
  line(pointOne.x, pointOne.y, pointTwo.x, pointTwo.y);
  ellipse(pointOne.x, pointOne.y, 5, 5);
  ellipse(pointTwo.x, pointTwo.y, 5, 5);
  
  float mag = dist(pointOne.x, pointOne.y, pointTwo.x, pointOne.y);
  text(mag, pointTwo.x + 10, pointTwo.y + 10);
}
