float faceColor;

void setup()
{
  size(300,300);
}

void draw()
{
  background(255);
  
  drawSmiley(150,150,50,color(255,255,0));
  drawSmiley(200,250,100,color(137,82,50));
  
  faceColor = distFromCenter(mouseX,mouseY);
  drawSmiley(mouseX,mouseY,30,color(faceColor,faceColor,50));

}

void drawSmiley(float x, float y, float r, color face)
{ 
  //Draw Main Head
  fill(face);
  ellipse(x,y,r,r);
  
  //Draw Eyes
  fill(0);
  ellipse(x - r/5,y - r/10,r/10,r*3/10);
  ellipse(x + r/5,y - r/10,r/10,r*3/10);
  
  //Draw Mouth
  arc(x,y + r/10,r*3/5,r*3/5,0,PI,CHORD);
}

//Calculates the distance of any point from the center of the window
float distFromCenter(float x, float y)
{
  float dx = width/2 - x;
  float dy = height/2 - y;
  float d = sqrt(dx*dx + dy*dy);
  return d;
}
