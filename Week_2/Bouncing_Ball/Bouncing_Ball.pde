//ball position Values
float posX;
float posY;

//Assign initial speeds within a random range
float speedX = random(1,5);
float speedY = random(1,5);

void setup()
{
  size(300,300);
  
  //Set initial possition to the middle of the screen
  posX = width/2;
  posY = height/2;
}

void draw()
{
  //Reset screen
  background(255);
  
  //Draw Ball
  fill(0);
  ellipse(posX,posY,10,10);
  
  
  //Move Ball based on speed
  posX += speedX;
  posY += speedY;
  
  //Change Direction when the ball hits an edge
  if((posX > width) || (posX < 0))
  {
    speedX *= -1;
  }
  
  if((posY > height) || (posY < 0))
  {
    speedY *= -1;
  }
}
