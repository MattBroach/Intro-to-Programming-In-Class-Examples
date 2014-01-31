class Smiley
{
  float x;
  float y;
  float r;
  color face;
  AudioPlayer laugh;
  
  //This constructor allows us to build different instances of Smiley
  //with different values
  Smiley(float _x, float _y, float _r, color _face, String filename)
  {
    x = _x;
    y = _y;
    r = _r;
    face = _face;
    laugh = minim.loadFile(filename);
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
  
  //Moves the smiley.  Move function also sets the Gain using the y
  //and the Pan using the x
  void move(float newX, float newY)
  {
    x = newX;
    y = newY;
    
    laugh.setGain(map(y,0,height,12,-40));
    laugh.setPan(map(x,0,width,1,-1));
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
  
  //play the audio from the beginning
  void hah()
  {
      laugh.rewind();
      laugh.loop();
  }
  
  //pause the audio
  void pause()
  {
    laugh.pause();
  }
  
  //close the connection
   void close()
  {
    laugh.close();
  }
}
