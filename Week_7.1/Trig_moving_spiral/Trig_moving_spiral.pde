float r = 0;
float theta = 0;
float startTheta = 0;

void setup()
{
  size(400,400);
  smooth();
}

void draw()
{
  background(255);
  
  //reset to initial values
  theta = startTheta;
  r = 0;

  //Make sure the while loop runs for as long as r doesn't reach the corners
  while(r < dist(width/2,height/2,width,height))
 { 
    //Draw Ellipse based on polar coordinates
    fill(0);
    ellipse(r*cos(theta) + width/2,r*sin(theta) + height/2,r/15,r/15);
  
    //increment r and theta to create spiral
    r += .1;
    theta += PI/100;
 }
 
 startTheta += PI/20;
}
