Missile[] missiles = new Missile[1000];
int totalMissiles = 0;

void setup()
{
    size(400,400);
    rectMode(CENTER);
}

void draw()
{
  background(255);
  
  for(int i = 0; i < totalMissiles; i++)
  {
    if(!missiles[i].exploded)
    {
      missiles[i].move();
      missiles[i].hitCheck(mouseX,mouseY);
      missiles[i].display();
    }
  }
}

class Missile
{
  float posX, posY;
  float mWidth, mHeight;
  float speed;
  boolean exploded;
  
  //Initialize each missile to be right off the top of the screen
  Missile(float _x, float _speed)
  {
    mHeight = 30;
    mWidth = mHeight/3;
    
    posX = _x;
    posY = -mHeight/2;
    
    speed = _speed;
    exploded = false;
  }
  
  //Draw Missile
  void display()
  {
    fill(0);
    rect(posX,posY,mWidth,mHeight);
    triangle(posX+mWidth/2,posY+mHeight/2,posX-mWidth/2,posY+mHeight/2,posX,posY+mHeight*5/8);
    triangle(posX,posY-mHeight*1/4,posX-mWidth*3/4,posY-mHeight*5/8,posX+mWidth*3/4,posY-mHeight*5/8);
  }
  
  //Move Missile Downward
  void move()
  {
    posY += speed;
  }
  
  void hitCheck(float currentX, float currentY)
  {
    if((currentX > posX - mWidth/2) && (currentX < posX + mWidth/2) && (currentY > posY - mHeight/2) && (currentY < posY + mHeight/2))
    {
      exploded = true;
    }
  }
}

void keyPressed()
{
  missiles[totalMissiles] = new Missile(random(width), random(1,5));
  
  if(totalMissiles < missiles.length)
  {
    totalMissiles++;
  }
  else
  {
    totalMissiles = 0;
  }
}
  
