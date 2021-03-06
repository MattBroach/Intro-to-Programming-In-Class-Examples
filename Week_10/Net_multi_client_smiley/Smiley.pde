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
  
  //Draw Smiley to Screen
  void drawSmiley()
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
  
  //Moves the smiley
  void move(float newX, float newY)
  {
    x = newX;
    y = newY;
  }
  
  //Checks to see if the given coordinates overlap with the Smiley
  boolean overlap(float checkX, float checkY)
  {
    float d = dist(x,y,checkX,checkY);
    if(d < r/2)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  //Sends movement data to the server
  void drag(float newX, float newY, int index)
  {
    //take all the data we want to send: x, y, and smiley number
    //and convert to a single string
    //attach the end-of-message character (in this case, '*')
    String out = index + "," + newX + "," + newY + "*";
    //Write our new string to the server
    client.write(out);
  }
}
