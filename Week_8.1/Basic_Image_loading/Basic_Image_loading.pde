//Use the PImage class to store images
PImage myImg;

void setup()
{
  size(400,400);
  
  //loadImage() puts the image file the PImage
  myImg = loadImage("Matt.jpg");
}

void draw()
{
   //use the image() function to display the image
   image(myImg,0,0);
}
