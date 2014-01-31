//ball position Values
float posX;
float posY;

//Assign initial speeds within a random range
float speedX = random(1,5);
float speedY = random(1,5);

//set ballsize
float ballWidth = 10;
float ballHeight = 10;

//definte acceleration
float gravity = .1;

void setup()
{
  size(300,300);
  
  //Set initial possition to the middle of the screen
  posX = width/2;
  posY = 0;
}

void draw()
{
  //Reset screen
  background(255);
  
  //Draw Ball
  fill(0);
  ellipse(posX,posY,ballWidth,ballHeight);
  
  
  //Move Ball based on speed
  posX += speedX;
  posY += speedY;
  
  speedY += gravity;
  
  //Change Direction when the ball hits an edge
  if((posX > width - ballWidth/2) || (posX < 0 + ballWidth/2))
  {
    speedX *= -1;
  }
  
  if(posY > height - ballHeight/2)
  {
    speedY *= -0.95;
  }
}
