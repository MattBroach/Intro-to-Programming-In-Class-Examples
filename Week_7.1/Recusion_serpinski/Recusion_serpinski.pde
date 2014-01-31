void setup()
{
  size(400,400);
}

void draw()
{
  background(255);
  
  serp(0,0,width,height);
}

void serp(float x1,float y1,float x2, float y2)
{
  triangle(x1,y2,(x1+x2)/2,y1,x2,y2);
  
  if(x2 - x1 > 2)
  {
    serp(x1,(y2+y1)/2,(x1+x2)/2,y2);
    serp((x1+x2)/2,(y1+y2)/2,x2,y2);
    serp(x1+(x2-x1)/4,y1,x1+3*(x2-x1)/4,(y1+y2)/2);
  }
}
