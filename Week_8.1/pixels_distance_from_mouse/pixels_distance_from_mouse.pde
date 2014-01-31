PImage yos;

void setup()
{
  size(400,400);
  
  yos = loadImage("Yosemite.jpg");
}

void draw()
{
  //loadPixels puts all of the images pixels into the pixel[] array
  loadPixels();
  
  //Each PImage also has its own pixel[] array
  yos.loadPixels();
  
  //Cycle through all pixels in the image
  for(int y = 0; y < height; y++)
  {
    for(int x = 0; x < width; x++)
    {
      //Convert from 2D array to 1D array
      int i = x + y*width;
      
      //Pull the r,g,b values out for the pixel
      float r = red(yos.pixels[i]);
      float g = green(yos.pixels[i]);
      float b = blue(yos.pixels[i]);
      
      //Calculate the pixels distance from the mouse
      float d = dist(x,y,mouseX,mouseY);
      
      //Chance the color based on that distance
      r -= d;
      g += d;
      
      //Write the r,g,b values to the general pixel array
      pixels[i] = color(r,g,b);
    }
  }
  
  //update the general pixel array
  updatePixels();
}
