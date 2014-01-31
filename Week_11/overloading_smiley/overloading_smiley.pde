Smiley s1;
Smiley s2;

void setup()
{
  size(400,400);
  
  //This uses the constructor that takes four arguments
  s1 = new Smiley(width/2,height/2,100,color(255,255,0));
  
  //This uses the constructor that takes NO arguments
  s2 = new Smiley();
}

void draw()
{
  background(255);
  
  s1.display();
  
  s2.display();
}
