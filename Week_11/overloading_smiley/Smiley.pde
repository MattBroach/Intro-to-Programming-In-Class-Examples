class Smiley
{
  float x;
  float y;
  float r;
  color face;
  
  //This constructor allows us to build different instances of Smiley
  //with different values
  Smiley(float _x, float _y, float _r, color _face)
  {
    x = _x;
    y = _y;
    r = _r;
    face = _face;
  }
  
  //Overloading the constructor.  This one assignes random values within certain constraints to the Smiley object
  Smiley()
  {
    x = random(width);
    y = random(height);
    r = random(10,200);
    
    float temp = random(255);
    face = color(temp,temp,0);
  }
  
  //Draw Smiley to Screen
  void display()
  { 
    //Draw Main Head
    fill(face);
    ellipse(x,y,r,r);
    
    //Draw Eyes
    fill(0);
    ellipse(x - r/5,y - r/10,r/10,r*3/10);
    ellipse(x + r/5,y - r/10,r/10,r*3/10);
    
    //Draw Mouth
    arc(x,y + r/10,r*3/5,r*3/5,0,PI,CHORD);
  }
  
  
}
