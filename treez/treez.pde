float a = 0;

void setup() { 
  size(720, 480);
  pixelDensity(2);
  
  
}

void draw() { 
  background(200);
  translate(width/2, height/2);
  branch(100);
  a += 0.01;
  //saveFrame("####-trees.png");
} 

void branch(float len) { 
  
  if (len == 100) { 
    stroke(0,0);
  } else {
    stroke(0, len);
  }
  line(0, 0, 0, -len);
  translate(0, -len);
  
  
  if (len > 5) { 
    pushMatrix();
    rotate(a);
    branch(len*0.7);
    popMatrix();
    if (len > 7) { 
          pushMatrix();
    rotate(-a);
    branch(len*0.9);
    popMatrix();
    }

  }
}
