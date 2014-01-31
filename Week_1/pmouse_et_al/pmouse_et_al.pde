void setup()
{
 //Set up the Screen and Refresh 
  size(200,200);
  background(255);
  frameRate(10);
  
  //Rectangle default info
  rectMode(CORNERS);
  fill(150);
  
}

void draw()
{
  //Draw rectangles using current and previous mouse position
  rect(mouseX,mouseY, pmouseX, pmouseY);
}

void mousePressed()
{
  //When mouse is pressed, reset the image to black
  background(0);
}

void keyPressed()
{
  //When key is pressed, reset the image to white
  background(255);
}
