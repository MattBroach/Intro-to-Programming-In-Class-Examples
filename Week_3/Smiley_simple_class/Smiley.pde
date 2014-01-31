class Smiley
{
  float x;
  float y;
  float r;
  color face;
  
  //Constructor
  Smiley()
  {
    x = width/2;
    y = height/2;
    r = 50;
    face = color(255,255,0);
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
  
  //Change face color based on distance from center;
  void changeFace()
  {
    float faceChange = distFromCenter(mouseX,mouseY);
    face = color(faceChange,faceChange,0);
  }
}
