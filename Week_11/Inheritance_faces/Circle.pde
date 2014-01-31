class Circle extends Face
{
  //Properties unique to the Circle class
  color face;
  
  Circle(float _x, float _y, float _r, color _face)
  {
    //super() passes information to the parent constructor
    super(_x, _y, _r);
    face = _face;
  }
  
  void display()
  {
    //Draw the face
    fill(face);
    ellipse(x,y,r,r);
    
    //access the display method in the parent class
    super.display();
  }
  
  //This overlap function is unique to the Circle class
  //Due to its unique shape
  boolean overlap(float newX, float newY)
  {
    float d = dist(x,y,newX,newY);
    if(d < r/2)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  //This method can ONLY be accessed by circle objects
  void changeFace()
  {
    face = color(random(255),random(255),0);
  }
}
