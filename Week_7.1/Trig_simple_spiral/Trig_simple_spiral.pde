float r = 0;
float theta = 0;

void setup()
{
  size(400,400);
}

void draw()
{
  //Draw Ellipse based on polar coordinates
  fill(0);
  ellipse(r*cos(theta) + width/2,r*sin(theta) + height/2,10,10);
  
  //increment r and theta to create spiral
  r += .1;
  theta += PI/100;
}
