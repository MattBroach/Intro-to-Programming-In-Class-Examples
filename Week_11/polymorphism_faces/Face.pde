class Face
{
  //These values are shared by all face objects AND all Square and Circle objects
  float x;
  float y;
  float r;
  
  //This constuctor can be accessed by child classes using super()
  Face(float _x, float _y, float _r)
  {
    x = _x;
    y = _y;
    r = _r;
  }
  
  //Draw Face to Screen
  void display()
  { 
    
    //Draw Eyes
    fill(0);
    ellipse(x - r/5,y - r/10,r/10,r*3/10);
    ellipse(x + r/5,y - r/10,r/10,r*3/10);
    
    //Draw Mouth
    arc(x,y + r/10,r*3/5,r*3/5,0,PI,CHORD);
  }
  
  //Moves the Face.  This method is accessible to all children
  void move(float newX, float newY)
  {
    x = newX;
    y = newY;
  }
 
  //dummy function to be overwritten by the child versions
  boolean overlap(float newX, float newY)
  {
     return true;
  }
}
