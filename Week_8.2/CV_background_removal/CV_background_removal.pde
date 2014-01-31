import processing.video.*;

Capture video;

color target = color(255,0,0);

PImage backImage;

void setup()
{
  size(320,240);
  
  //Start the video
  video = new Capture(this,320,240,30);
  video.start();

  //Create an empty image the same size as the video
  backImage = createImage(video.width,video.height,RGB);

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
  
  loadPixels();
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
      
      //pull rgb from the save frame
      float r2 = red(backImage.pixels[i]);
      float g2 = green(backImage.pixels[i]);
      float b2 = blue(backImage.pixels[i]);
      
      //calculate distance the current pixel and the saved pixel
      float d = dist(r1,g1,b1,r2,g2,b2);
      
      //If the distance is less than some threshold, it's probably the background
      //So we draw black
      //Otherwise, we draw from the current video frame
      if(d < 40)
      {
        pixels[i] = color(0);
      }
      else
      {
        pixels[i] = video.pixels[i];
      }
      
    }
  }
  
  updatePixels();
  
}

//When the mouse is pressed, copy the current video frame into backImage
void mousePressed()
{
  backImage.copy(video,0,0,video.width,video.height,0,0,video.width,video.height);
  backImage.updatePixels();
}
