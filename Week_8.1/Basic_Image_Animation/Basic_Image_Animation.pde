PImage rors;

float posTheta = 0;
float sizeTheta = 0;
float rotTheta = 0;

void setup()
{
  size(400,400);
  
  rors = loadImage("Rors_small.jpg");
}

void draw()
{
  background(0);
  
  //move and rotate the image
  translate(width/2 + 100*cos(posTheta),height/2+100*sin(posTheta));
  rotate(rotTheta);
  
  //draw the image with oscillating size
  image(rors,0,0,100*cos(sizeTheta),100*cos(sizeTheta));
  
  //incriment thetas
  posTheta += .1;
  sizeTheta += PI/100;
  rotTheta += PI/30;
}
