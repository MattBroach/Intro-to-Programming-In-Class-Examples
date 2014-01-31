float[] heights = new float[100];

void setup()
{
  size(300,300);
  noStroke();
  fill(0);
  
  randomHeights();
}

void draw()
{
  background(255);
  for(int i = 0; i < heights.length; i++)
  {
    rect(i*3,height-heights[i],3,heights[i]);
  }
}

void keyPressed()
{
  randomHeights();
}

void randomHeights()
{
  for(int i = 0; i < heights.length; i++)
  {
    heights[i] = 0;
  }
  
  for(int i = 0; i < 10000; i++)
  {
    heights[floor(random(heights.length))]++;
  }
}
