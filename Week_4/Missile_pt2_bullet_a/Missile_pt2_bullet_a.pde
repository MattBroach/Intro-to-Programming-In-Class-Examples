Bullet b1;

void setup()
{
  size(400,400);
  
  b1 = new Bullet(width/2);
}

void draw()
{
  background(255);
  
  b1.display();
  b1.move();
}

void mousePressed()
{
  b1.x = width/2;
  b1.y = height;
  
  b1.fire(mouseX,width,0);
}

class Bullet
{
  float x;
  float y;
  float dX;
  float dY;
  
  Bullet(float _x)
  {
    x = _x;
    y = height;
    dX = 0;
    dY = 0;
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
  
