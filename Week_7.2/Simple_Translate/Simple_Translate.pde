void setup()
{
  size(400,400);
  rectMode(CENTER);
}

void draw()
{
  background(255);
  
  translate(50,50);
  rect(0,0,10,10);
  
  translate(300,0);
  rect(0,0,10,10);
  
  translate(0,300);
  rect(0,0,10,10);
  
  translate(-300,0);
  rect(0,0,10,10);
}
