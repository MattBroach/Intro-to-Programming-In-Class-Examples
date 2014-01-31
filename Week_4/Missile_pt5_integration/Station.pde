class Station
{
  float xShift;
  float yShift;
  float xPos;
  float yPos;
  
  Station(float _x)
  {
    xPos = _x;
    yPos = height;
    xShift = 0;
    yShift = 0;
  }
  
  //Draw Defense Station to the Screen
  void display()
  {
    //Draw Station
    fill(0);
    ellipse(width/2,height,50,50);
    
    //Draw Gun  
    ellipse(width/2+xShift, height-yShift,20,20);
  }
  
  //Move the Gun around the Station based on input values
  void move(float value, float min, float max)
  {    
    xShift = 25*cos(map(value,min,max,0,PI));
    yShift = 25*sin(map(value,min,max,0,PI));
  }
}
