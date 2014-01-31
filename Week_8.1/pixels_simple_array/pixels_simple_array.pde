void setup()
{
  size(400,400);
}

void draw()
{
  loadPixels();
  
  //Fill the entire pixel array with colors from black to white
  for(int i = 0; i < pixels.length; i++)
  {
    pixels[i] = color(i%255);
  }
  
  updatePixels();
}
