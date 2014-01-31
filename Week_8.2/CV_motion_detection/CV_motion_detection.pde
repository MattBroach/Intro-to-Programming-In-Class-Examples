import processing.video.*;

Capture video;

float threshold = 50;

PImage motionCheck;

void setup()
{
  size(320,240);
  
  //Start the video
  video = new Capture(this,320,240,30);
  video.start();

  motionCheck = createImage(video.width,video.height,RGB);
}

void draw()
{
  background(0);
  
  if(video.available())
  {
    motionCheck.copy(video,0,0,video.width,video.height,0,0,video.width,video.height);
    motionCheck.updatePixels();
    
    video.read();
  }
  
  video.loadPixels(); 
  motionCheck.loadPixels();
  loadPixels();
 
  for(int x = 0; x < width; x++)
  {
    for(int y = 0; y < height; y++)
    {
      //pull color from each grid point
      int i = int(x + y*width);
      
      //Pull rgb values from the current pixels
      float r1 = red(video.pixels[i]);
      float g1 = green(video.pixels[i]);
      float b1 = blue(video.pixels[i]);
      
      //pull rgb from the previous pixels
      float r2 = red(motionCheck.pixels[i]);
      float g2 = green(motionCheck.pixels[i]);
      float b2 = blue(motionCheck.pixels[i]);
      
      //If the distance is small, then there was no movement, and draw white
      //Otherwise, there was movement, and draw black
      float d = dist(r1,g1,b1,r2,g2,b2);
      if(d < threshold)
      {
        pixels[i] = color(255);
      }
      else
      {
        pixels[i] = color(0);
      }
      
    }
  }
  
  updatePixels();
}
