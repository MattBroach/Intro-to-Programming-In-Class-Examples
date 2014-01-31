import ddf.minim.*;

Minim minim;
Smiley smiley;
Smiley moreSmiley;

void setup()
{
  size(400, 400);

  //Makes the connection to sound hardware
  minim = new Minim(this);
  
  //By putting the audioFiles in the object itself
  //Each Smiley can have a different laugh
  smiley = new Smiley(width/4,height/2,100,color(255,255,0),"elmerlaugh.wav");
  moreSmiley = new Smiley(3*width/4, height/2,100,color(255,255,0),"tazlaugh.wav");
}


//Stop function runs when the program quits.  
//Use this to disconnect from hardware
void stop()
{
  moreSmiley.close();
  smiley.close();
  super.stop();
}

void draw()
{
  background(255);
  
  smiley.drawSmiley();
  moreSmiley.drawSmiley();
}

//Click on each smiley to hear its individual laugh
void mousePressed()
{
  if(smiley.overlap(mouseX,mouseY))
  {
    smiley.hah();
  }
  if(moreSmiley.overlap(mouseX,mouseY))
  {
    moreSmiley.hah();
  }
}
