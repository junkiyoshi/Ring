class Mover
{
  PVector center;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float range = 200;
  
  color bodyColor;
  float bodySize;
    
  Mover(float x, float y)  
  {
    center = new PVector(x, y);
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
    bodyColor = color(random(128, 255), random(128, 255), random(128, 255));
    bodySize = random(0.1, 2);
  }
  
  void applyForce(PVector force)
  {
    acceleration.add(force);
  }
  
  void update()
  {
    applyForce(new PVector(random(-0.01, 0.01), random(-0.01, 0.01)));
    
    float x = map(location.x, center.x - range, center.x + range, 0.01, -0.01);
    float y = map(location.y, center.y - range, center.y + range, 0.01, -0.01);
    applyForce(new PVector(x, y));
  
    velocity.add(acceleration);  
    PVector friction = velocity.copy();
    friction.mult(-1);
    friction.normalize();
    velocity.add(friction);
    
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display()
  {
    noStroke();
   
    fill(bodyColor, 200);
    ellipse(location.x, location.y, bodySize, bodySize);
  }
}