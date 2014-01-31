float[] fills = new float[200];

void setup()
{
  size(600,200);
  noStroke();
  
  randomFill();
}

void draw()
{
  //draw rectangles across the screen with the matching color
  for(int i=0; i < fills.length; i++)
  {
    fill(fills[i]);
    rect(i*3,0,3,height);
  }
}

void keyPressed()
{
  randomFill();
}

void randomFill()
{
  //fill with a uniform random Gray
  for(int i=0; i < fills.length; i++)
  {
    fills[i] = random(255);
  }
}
