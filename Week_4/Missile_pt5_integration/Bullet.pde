class Bullet
{
  float x;
  float y;
  float dX;
  float dY;
  boolean hit;
  
  Bullet(float _x)
  {
    x = _x;
    y = height;
    dX = 0;
    dY = 0;
    hit = false;
  }
  
  //Draw Bullet to Screen
  void display()
  {
    fill(0);
    ellipse(x,y,5,5);
  }
  
  //Move the Bullet based on the input speed values
  void move()
  {
    x += dX;
    y += dY;
  }
  
  //set the direction of the bullet when the bullet is fired
  void fire(float value, float min, float max)
  {
    dX = 2*cos(map(value,min,max,0,PI));
    dY = -2*sin(map(value,min,max,0,PI));
  }
}
