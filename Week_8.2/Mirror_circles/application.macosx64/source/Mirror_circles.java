import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Mirror_circles extends PApplet {



Capture video;

float cellSize = 10;
float cellX;
float cellY;

public void setup()
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
}

public void draw()
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
      int i = PApplet.parseInt(x*cellSize + y*cellSize*width);
      int c = video.pixels[i];
      
      //Scale the ellipse size to the brigthness of each pixel
      float scale = map(brightness(c),0,255,0,15);
      ellipse(x*cellSize + cellSize/2,y*cellSize + cellSize/2,scale,scale);
    }
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Mirror_circles" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
