import processing.video.*;

Capture video;

void setup()
{
  size(320,240);
  
  video = new Capture(this,320,240,30);
  
  video.start();
  
  noStroke();
}

void draw()
{
  if(video.available())
  {
    video.read();
  }
  
  //Capture objects store an image much like a PImage
  //That means we can load its pixels and do the same pixel-by-pixel analysis
  
  //Choose a random point
  float x = int(random(video.width));
  float y = int(random(video.height));
  
  //Convert that points coordinates to its index in the 1D pixel array
  int i = int(x + y*video.width);
  
  //Load the pixels
  loadPixels();
  video.loadPixels(); 
 
  float r = red(video.pixels[i]);
  float g = green(video.pixels[i]);
  float b = blue(video.pixels[i]);
  
  //Draw a semi-transparent circle at that point with the colors from 
  //the video
  fill(r,g,b,100);
  ellipse(x,y,20,20);
}
