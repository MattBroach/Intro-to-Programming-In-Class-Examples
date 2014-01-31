import processing.video.*;

Capture video;

color target = color(255,0,0);

void setup()
{
  size(320,240);
  
  //Start the video
  video = new Capture(this,320,240,30);
  video.start();

  //Set draw circle
  noFill();
  stroke(target);
  strokeWeight(4);
}

void draw()
{
  background(0);
  
  if(video.available())
  {
    video.read();
  }
  
  video.loadPixels(); 
 
  //Start a distance unrealistically far from the target
  float closest = 500; 
  int trackX = 0;
  int trackY = 0;
 
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
      
      //pull rgb from the target color
      float r2 = red(target);
      float g2 = green(target);
      float b2 = blue(target);
      
      //calculate distance between the points, and assign new closest
      //if necessary
      float d = dist(r1,g1,b1,r2,g2,b2);
      if(d < closest)
      {
        closest = d;
        trackX = x;
        trackY = y;
      }
      
    }
  }
  
  image(video,0,0);
  
  println(closest);
  
  //Draw circle around tracked pixel
  if(closest < 140)
  {
    ellipse(trackX,trackY,20,20);
  }
}
