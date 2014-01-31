float x[] = new float[50];
float y[] = new float[50];

void setup()
{
  size(400,400);
  noStroke();
  
  //initialize all values in the array to the center
  for(int i = 0; i < x.length; i++)
  {
    x[i] = 0;
    y[i] = 0;
  }
}

void draw()
{
  //Erase background
  background(255);
  
  //Shift array values
  for(int i = 0; i < x.length-1; i++)
  {
    x[i] = x[i+1];
    y[i] = y[i+1];
  }
  
  //Update last values in the array to the current mouse values
  x[x.length-1] = mouseX;
  y[y.length-1] = mouseY;
  
  //Draw the snake.  Older values are smaller and fainter
  for(int i = 0; i < x.length; i++)
  {
    fill(255,0,0,map(i,0,50,10,255));
    ellipse(x[i],y[i],i,i);
  }
}
