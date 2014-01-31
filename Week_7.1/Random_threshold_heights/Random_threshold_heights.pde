float[] heights = new float[100];
float prob;

//Threshold values.  Make sure they all add up to 1!
float small = .05;
float medium = .65;
float large = .3;

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

//When the key is pressed, refill the array with new values
void keyPressed()
{
  randomHeights();
}

void randomHeights()
{
  //Set heights to small, medium, or large based on Probability thresholds
  for(int i = 0; i < heights.length; i++)
  {
    prob = random(1);
    if(prob < small)
    {
      heights[i] = 50;
    }
    else if(prob < small + medium)
    {
      heights[i] = 100;
    }
    else
    {
      heights[i] = 150;
    }
  }

}
