Missile m1;

void setup()
{
    size(400,400);
    rectMode(CENTER);
    
    m1 = new Missile(width/2);
}

void draw()
{
  background(255);
  
  m1.display();
  m1.move();
}

class Missile
{
  float posX, posY;
  float mWidth, mHeight;
  
  //Initialize each missile to be right off the top of the screen
  Missile(float _x)
  {
    mHeight = 30;
    mWidth = mHeight/3;
    
    posX = _x;
    posY = -mHeight/2;
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
    posY += 2;
  }
}
