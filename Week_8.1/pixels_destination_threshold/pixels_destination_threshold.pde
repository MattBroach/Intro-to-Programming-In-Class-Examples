PImage yos;
PImage out;

float threshold = 127;

void setup()
{
  size(400,400);
  
  //createImage creates a blank (ie black) PImage
  yos = loadImage("Yosemite.jpg");
  out = createImage(yos.width,yos.height,RGB);
}

void draw()
{
  yos.loadPixels();
  out.loadPixels();
  
  for(int y = 0; y < height; y++)
  {
    for(int x = 0; x < width; x++)
    {
      int i = x + y*width;
      
      //brightness() returns the luminance value of an color, from 0-255
      //Here, we make the pixel white if it's over a certain brightness,
      //black otherwise
      if(brightness(yos.pixels[i]) > threshold)
      {
        out.pixels[i] = color(255);
      }
      else
      {
        out.pixels[i] = color(0);
      }
    }
  }
  out.updatePixels();
  image(out,0,0);
}

//Use the up and down arrow keys to change the brightness threshold
void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == UP)
    {
      threshold += 10;
    }
    if(keyCode == DOWN)
    {
      threshold -= 10;
    }
  }
  
  threshold = constrain(threshold,0,255);
}
