PImage[] walk = new PImage[15];

int frame = 0;

void setup()
{
  size(400,400);
  
  //Use strings + for loop to load all images in a sequence
  for(int i = 0; i < walk.length; i++)
  {
    walk[i] = loadImage("Walk" + i + ".jpg");
  }
  
  frameRate(10);
}

void draw()
{
  //Increment which image is showing each frame
  image(walk[frame%15],0,0);
  frame++;
}
