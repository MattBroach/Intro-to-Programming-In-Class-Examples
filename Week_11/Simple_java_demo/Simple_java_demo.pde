float circ;

void setup()
{
  size(100,100);
  
  rectMode(CENTER);
}

void draw()
{
  background(255);
  fill(map(mouseX,0,width,0,255));
  rect(width/2,height/2,50,50);
}
