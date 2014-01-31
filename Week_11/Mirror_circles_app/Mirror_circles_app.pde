import processing.video.*;

Capture video;

float cellSize = 10;
float cellX;
float cellY;

void setup()
{
  size(320,240);
  
  //Start the video
  video = new Capture(this,320,240,30);
  video.start();
  
  //Set the GridSize
  cellX = width/cellSize;
  cellY = height/cellSize;
  
  //Set ellipse properties
  noStroke();
  fill(255);
  
  frame.setTitle("My mirror circles!");
}

void draw()
{
  background(0);
  
  if(video.available())
  {
    video.read();
  }
  
  
  video.loadPixels(); 
 
  for(int x = 0; x < cellX; x++)
  {
    for(int y = 0; y < cellY; y++)
    {
      //pull color from each grid point
      int i = int(x*cellSize + y*cellSize*width);
      color c = video.pixels[i];
      
      //Scale the ellipse size to the brigthness of each pixel
      float scale = map(brightness(c),0,255,0,15);
      ellipse(x*cellSize + cellSize/2,y*cellSize + cellSize/2,scale,scale);
    }
  }
}
