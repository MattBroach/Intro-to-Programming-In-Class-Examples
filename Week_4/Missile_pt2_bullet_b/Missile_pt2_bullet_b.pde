Bullet[] bullets = new Bullet[500];
int bulletCount = 0;

void setup()
{
  size(400,400);
}

void draw()
{
  background(255);
  
  for(int i = 0; i < bulletCount; i++)
  {
    bullets[i].display();
    bullets[i].move();
  }
}

void mousePressed()
{
  bullets[bulletCount] = new Bullet(width/2);
  bullets[bulletCount].fire(mouseX,width,0);
  
  bulletCount++;
  
  if(bulletCount >= bullets.length)
  {
    bulletCount = 0;
  }
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
  
