PImage yos;

//The convolution matrix.  This array of values is multiplied by
//and then averaged for every pixel in the image
float[][] matrix = { {3, 2, 1},
                     {-5, 3, 2},
                     {-4, -5, 3}};

float w = 50;

void setup()
{
  size(400,400);
  
  yos = loadImage("Yosemite.jpg");
}

void draw()
{
  image(yos,0,0);
  
  //Define the part of the image that we'll apply the
  //convolution matrix to
  int xstart = int(width/4);
  int ystart = int(height/4);
  
  int xend = int(.75*width);
  int yend = int(.75*height);
  
  //We have to constrain the beginning and end of the parts
  //we're applying the matrix to, or we will go outside the range of the
  //pixel array and we'll end up crashing the program
  xstart = constrain(xstart,1,width-1);
  ystart = constrain(ystart,1,height-1);
  
  xend = constrain(xend,1,width-1);
  yend = constrain(yend,1,height-1);
  
  loadPixels();
  
  //iterate through every pixel in the selected area
  for(int x = xstart; x < xend; x++)
  {
    for(int y = ystart; y < yend; y++)
    { 
      float r = 0;
      float g = 0;
      float b = 0;
      
      //For each pixel, we go through the corresponding 3x3 set of neighbors
      //Multiply each pixel by it's corresponding place in the convolution
      //matrix, and then add those values together.  THAT because the color
      //value of the center pixel
      for(int p = 0; p < 3; p++)
      {
        for(int q = 0; q < 3; q++)
        {
          int i = (x + p - 1) + (y + q - 1) * yos.width;
          
          r += red(yos.pixels[i]) * matrix[p][q];
          g += green(yos.pixels[i]) * matrix[p][q];
          b += blue(yos.pixels[i]) * matrix[p][q];
        }
      }
      
      r = constrain(r,0,255);
      b = constrain(b,0,255);
      g = constrain(g,0,255);
      
      //Load the new value into our general pixel array
      int i = x + y * yos.width;
      pixels[i] = color(r,g,b);
    }
  }
  updatePixels();
  
  //Draw a bounding box, so we can see which part of the image we're convolving
  stroke(0);
  noFill();
  rectMode(CORNERS);
  rect(xstart,ystart,xend,yend);
}

