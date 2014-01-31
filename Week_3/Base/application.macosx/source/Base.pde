

void setup()
{
  size(300,300);
}

void draw()
{
  background(255);
  
  fill(255,255,0);
  ellipse(150,150,50,50);
  
  fill(0);
  ellipse(140,145,5,15);
  ellipse(160,145,5,15);
  
  arc(150,155,30,30,0,PI,CHORD);
}
