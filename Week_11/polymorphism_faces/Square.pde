class Square extends Face
{
  //Paramters unique to the Square class
  color face;
  
  //Constructor has its own arguments as well as calling those from super()
  Square(float _x, float _y, float _r, color _face)
  {
    super(_x, _y, _r);
    face = _face;
  }
  
  void display()
  {
    rectMode(CENTER);
    
    fill(face);
    rect(x,y,r,r);
    
    super.display();
  }
  
  //Overlap function unique to square, due to its different shape from Circle
  boolean overlap(float newX, float newY)
  {
    if(newX > (x-r/2) && newX < (x + r/2) && newY > (y - r/2) && newY < (y + r/2))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}
