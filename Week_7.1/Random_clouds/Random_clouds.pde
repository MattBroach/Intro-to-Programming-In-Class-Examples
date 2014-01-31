int trailLength = 50;

//Arrays to store position values of our two clouds
float[] randomCloudX = new float[trailLength];
float[] randomCloudY = new float[trailLength];
float[] perlinCloudX = new float[trailLength];
float[] perlinCloudY = new float[trailLength];

float perlin;
float t = 0;

void setup()
{
  size(400,400);
  
  //Set both clouds to start at the bottom of the screen
  for(int i = 0; i < trailLength; i++)
  {
    randomCloudX[i] = width/3;
    randomCloudY[i] = height;
    perlinCloudX[i] = 2*width/3;
    perlinCloudY[i] = height;
  }
  
  noStroke();
  frameRate(30);
}

void draw()
{
  background(255);
  
  //Shift all values over to make room for the most recent values
  for(int i = 0; i < trailLength - 1; i++)
  {
    randomCloudX[i] = randomCloudX[i+1];
    randomCloudY[i] = randomCloudY[i+1];
    perlinCloudX[i] = perlinCloudX[i+1];
    perlinCloudY[i] = perlinCloudY[i+1];
  }
  
  //Shift the x position of the clouds by a random amount
  randomCloudX[trailLength-1] += random(-5,5);
  randomCloudY[trailLength-1] -= 1;
  
  //Shift the x position of the clouds by Perlin noise, with the
  //same range as above
  perlin = noise(t)*10 - 5;
  perlinCloudX[trailLength-1] -= perlin;
  perlinCloudY[trailLength-1] -= 1;
  t += .1;
  
  //Draw the two clouds, with older values fainter
  for(int i = 0; i < trailLength - 1; i++)
  {
    fill(127,i*5);
    ellipse(randomCloudX[i],randomCloudY[i],40,10);
    
    fill(127,i*5);
    ellipse(perlinCloudX[i],perlinCloudY[i],40,10);
  }
}

void mousePressed()
{
  //Reset clouds to starting positions
  randomCloudX[trailLength-1] = width/3;
  randomCloudY[trailLength-1] = height;
  perlinCloudX[trailLength-1] = 2*width/3;
  perlinCloudY[trailLength-1] = height;
}
