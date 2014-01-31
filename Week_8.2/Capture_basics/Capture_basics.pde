//To use video in processing, you need to import the video library
import processing.video.*;

//To get live video, use the Capture object
Capture video;

void setup()
{
  size(320,240);
  
  //Call constructor.  Capture constructor takes four arguments:
  //(this,width,height,framerate)
  video = new Capture(this,320,240,30);
  
  //start the video playing
  video.start();
  
  noStroke();
}

void draw()
{
  //Notifies if a new frame is there, and if so, reads that frame
  if(video.available())
  {
    video.read();
  }
  
  //Capture objects can be drawn on the screen using image() function, like PImages
  image(video,0,0);
}
