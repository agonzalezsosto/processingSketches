ParticleSystem ps;
float lines1 = 0;

void setup() { 
  size(720, 480);
  pixelDensity(2);
  ps = new ParticleSystem();
}

void draw() { 
  //background(200);
  ps.update();
  
  lines1 += 0.001;
  for(int i = 0; i < width; i += 20) { 
    stroke(0,0);
    fill(cos(lines1 * i) * 255);
    rect(i, height-50, 20, 50);
    fill(sin(lines1 * i + PI) * 255);
    rect(i, 0, 20, 50);
    
    fill(sin(lines1 * i) * 255);
    rect(i, height-100, 20, 50);
    fill(cos(lines1 * i + PI) * 255);
    rect(i, 50, 20, 50);
    
    fill(cos(lines1 * i + PI) * 255);
    rect(i, height/2 + (cos(i) * 10), 10, 10);
  }
  
  //saveFrame("######-yay.png");
  
}
