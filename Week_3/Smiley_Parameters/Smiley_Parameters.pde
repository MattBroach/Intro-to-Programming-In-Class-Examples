float x, y, r;
color face;

void setup()
{
  size(300,300);
}

void draw()
{
  background(255);
  
  x = 150;
  y = 150;
  r = 50;
  face = color(255,255,0);
  
  //Draw Main Head
  fill(face);
  ellipse(x,y,r,r);
  
  //Draw Eyes
  fill(0);
  ellipse(x - r/5,y - r/10,r/10,3/10 * r);
  ellipse(x + r/5,y - r/10,r/10,3/10 * r);
  
  //Draw Mouth
  arc(x,y + r/10,3/5 * r,3/5 * r,0,PI,CHORD);
}
