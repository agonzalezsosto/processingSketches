float c = 0.0;
float xCenter = 0;
float yCenter = 0;
float rc = 0.0;
float bc = 0.0;
float gc = 0.0;
float noise = 0.0;

void setup() {
  size(1080, 720);
  background(0);
  pixelDensity(2);
  frameRate(400);
}

void draw() {
  
  //translate(width/2,height/2);
  //beginShape();
  
  //translate(width/2, height/2);
  //vertex(width/2, height/2);
  //for(int i = 0; i < 10; i++) {
    
  //}
  
  //endShape();
  c += 0.1;
  noise += 0.1;
  
  float x = cos(c + noise(noise));
  float y = sin(c) + noise(noise, noise);
  
  xCenter = (xCenter +  0.4 + noise(noise)) % width;
  
  noStroke();
  
  rc += 0.4;
  bc += 0.6 + rc;
  gc += 0.3;
  
  float rs = map(sin(rc + noise(bc)), -1, 1, 0, 255);
  float bs = map(cos(bc + rc), -1, 1, 0, 255);
  float gs = map(sin(gc + noise(rs)), -1, 1, 0, 255);
  
  yCenter = (yCenter + 1 + noise(xCenter)) % height;
  
  fill(rs, gs, bs, 10);
  float mapX = map(x, -1, 1, -100 + xCenter, 100 + xCenter);
  float mapY = map(y, -1, 1, -100 + yCenter, 100 + yCenter);
  
 colorMode(HSB, 100);
  
  //translate(0, height/2);
  ellipse(mapX, mapY, 100, 100);
  
}
