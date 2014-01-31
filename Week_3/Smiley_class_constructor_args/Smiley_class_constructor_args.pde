Smiley s1;
Smiley s2;

void setup()
{
  size(300,300);
  
  s1 = new Smiley(width/2, height/2,50,color(255,255,0));
  s2 = new Smiley(200,200,30,color(150,150,50));
}

void draw()
{
  background(255);
  
  s1.drawSmiley();
 
  s2.changeFace();
  s2.move(mouseX,mouseY);
  s2.drawSmiley();
}

//Calculates the distance of any point from the center of the window
float distFromCenter(float x, float y)
{
  float dx = width/2 - x;
  float dy = height/2 - y;
  float d = sqrt(dx*dx + dy*dy);
  return d;
}


  
