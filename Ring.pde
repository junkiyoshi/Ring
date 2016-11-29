Mover[] movers = new Mover[320];

void setup()
{
  size(1280, 720);
  background(0);
  frameRate(30);
  
  for(int i = 0; i < movers.length; i++)
  {
    float angle = random(360);
    float x = 300 * cos(radians(angle)) + width / 2;
    float y = 300 * sin(radians(angle)) + height / 2;
    movers[i] = new Mover(x, y);
  } 
}

void draw()
{
  background(0);
  
  for(Mover m : movers)
  {
    m.update();
    m.display();
  }
}