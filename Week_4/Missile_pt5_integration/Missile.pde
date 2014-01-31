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
  
  void hitCheck(Bullet bullet)
  {
    if((bullet.x > posX - mWidth/2) && (bullet.x < posX + mWidth/2) && (bullet.y > posY - mHeight/2) && (bullet.y < posY + mHeight/2))
    {
      exploded = true;
      bullet.hit = true;
    }
  }
}
