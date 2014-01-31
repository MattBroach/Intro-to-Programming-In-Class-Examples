PImage face;
PImage rors;

float alpha = 255;
float r = 255;
float g = 255;
float b = 255;

void setup()
{
  size(400,400);
  
  face = loadImage("Face.jpg");
  rors = loadImage("Rors_mid.jpg");
}

void draw()
{
  image(rors,0,0);
  
  //tint() allows you to change the r,g,b values OR change the alpha
  tint(r,g,b,alpha);
  image(face,0,0);
}

//Use arrow keys to increse or decrease alpha
void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == UP)
    {
      alpha += 10;
    }
    if(keyCode == DOWN)
    {
      alpha -= 10;
    }
  }
  
  alpha = constrain(alpha,0,255);
}

//Press mouse to randomly re-color the image
void mousePressed()
{
  r = random(255);
  g = random(255);
  b = random(255);
}
