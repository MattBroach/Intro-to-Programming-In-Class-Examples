import processing.video.*;

PFont myFont;

Capture video;

//ASCII characters chosen in order of increasing density
String ASCII = " .:*oebOB@";

//Gridsize for video pixels
float cellSize = 15;
float cellX;
float cellY;

void setup()
{
  size(640,480);
 
  myFont = loadFont("CB.vlw");
  
  video = new Capture(this,640,480,30);
  video.start();
  
  cellX = width/cellSize;
  cellY = height/cellSize;
}

void draw()
{
  background(0);
  fill(255);
  
  if(video.available())
  {
    video.read();
  }
  video.loadPixels();
  
  textFont(myFont);
  
  for(float x = 0; x < cellX; x++)
  {
    for(float y = 0; y < cellY; y++)
    {
      //Extract the brightness for each video grid cell
      int i = int(x*cellSize + y*cellSize*width);
      float p = brightness(video.pixels[i]);
      
      //Map the brightness of the pixel to the length of the ASCII character string
      p = map(p,0,255,0,ASCII.length()-1);
      
      //Write the correspingind character to the screen based on how bright the chosen pixel is
      text(ASCII.charAt(floor(p)),x*cellSize,y*cellSize);
    }
  }
  
  saveFrame("frames/vid_text-####.png");
}

void mousePressed()
{
  exit();
}
