float[] fills = new float[200];
float threshold = .05;
float prob;

void setup()
{
  size(600,200);
  noStroke();
  
  randomFill();
}

void draw()
{
  //draw rectangles across the screen with the corresponding color
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
  //Fill with white if under threshold, otherwise black
  for(int i=0; i < fills.length; i++)
  {
    prob = random(1);
    if(prob < threshold)
    {
      fills[i] = 255;
    }
    else
    {
      fills[i] = 0;
    }
  }
}

//cycle through increasing probability threshold
void mousePressed()
{
  threshold += .05;
  if(threshold >= 1)
  {
    threshold = 0;
  }
}
