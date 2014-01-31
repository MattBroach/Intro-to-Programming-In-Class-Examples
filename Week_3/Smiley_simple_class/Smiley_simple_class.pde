float faceColor;
Smiley firstSmiley;

void setup()
{
  size(300,300);
  
  firstSmiley = new Smiley();
}

void draw()
{
  background(255);
  
  firstSmiley.drawSmiley();
  firstSmiley.changeFace();

}

//Calculates the distance of any point from the center of the window
float distFromCenter(float x, float y)
{
  float dx = width/2 - x;
  float dy = height/2 - y;
  float d = sqrt(dx*dx + dy*dy);
  return d;
}


  
