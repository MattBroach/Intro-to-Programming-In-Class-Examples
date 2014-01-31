PImage myImg;

float y = 0;

void setup()
{
  size(400,400);
  
  myImg = loadImage("Matt_big.jpg");
}

void draw()
{
  background(255);
  image(myImg,0,y);
  
  //Incriment the y attribute, causing the image to move upward
  y--;
  if(y < -400)
  {
    y = 0;
  }
}
