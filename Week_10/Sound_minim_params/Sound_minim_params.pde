import ddf.minim.*;

Minim minim;
Smiley smiley;

void setup()
{
  size(400, 400);

  //Makes the connection to sound hardware
  minim = new Minim(this);
  
  smiley = new Smiley(width/2, height/2,100,color(255,255,0),"4 Center Your Love.mp3");
  smiley.hah();
}


//Stop function runs when the program quits.  
//Use this to disconnect from hardware
void stop()
{
  smiley.close();
  minim.stop();
  super.stop();
}

void draw()
{
  background(255);
  
  smiley.drawSmiley();
  
  //move the smiley to change the audio parameters
  if(smiley.overlap(mouseX,mouseY) && mousePressed)
  {
    smiley.move(mouseX,mouseY);
  }
}

//Press a key to start/stop the audio
void keyPressed()
{
  if(smiley.laugh.isPlaying())
  {
    smiley.pause();
  }
  else
  {
    smiley.hah();
  }
}
