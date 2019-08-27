class ParticleSystem { 
  
  ArrayList<Particle> particleSystem;
  int numberOfParticles = 1000;
  
  ParticleSystem() {
    particleSystem = new ArrayList<Particle>();
    
    for(int i = 0; i < numberOfParticles; i++) { 
      PVector initialPosition = new PVector(random(width), random(height));
      PVector initialVelocity = new PVector(0, 0);
      PVector initialAcceleration = new PVector(random(-0.01, 0.01), random(-0.01, 0.01));
      particleSystem.add(new Particle(initialPosition, initialVelocity, initialAcceleration));
    }
  }
  
  void update() {
    for(int i = 0; i < numberOfParticles; i++) { 
      particleSystem.get(i).update();
      particleSystem.get(i).draw();
    }
  }
}
