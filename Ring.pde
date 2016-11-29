Mover[] movers = new Mover[4096];

void setup()
{
  size(1980, 1080);
  background(255);
  frameRate(30);
  
  for(int i = 0; i < movers.length; i++)
  {
    float angle = random(360);
    float x = 400 * cos(radians(angle)) + width / 2;
    float y = 400 * sin(radians(angle)) + height / 2;
    movers[i] = new Mover(x, y);
  } 
}

void draw()
{
  //background(255);
  
  for(Mover m : movers)
  {
    m.update();
    m.display();
  }
  
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 450)
  {
     exit();
  }
}