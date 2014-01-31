import ddf.minim.*;

Smiley smiley;

//Minim object holds all connections to sound hardware
Minim minim;
//AudioSnippet object holds soundfile for playback
AudioSnippet laugh;

void setup()
{
  size(400, 400);

  //Makes the connection to sound hardware
  minim = new Minim(this);


  //load the sample
  laugh = minim.loadSnippet("elmerlaugh.wav");
  
  smiley = new Smiley(width/2,height/2,100,color(255,255,0));
}


//Stop function runs when the program quits.  
//Use this to disconnect from hardware
void stop()
{
  laugh.close();
  super.stop();
}

void draw()
{
  background(255);
  
  smiley.drawSmiley();
}

//playback the soundfile when we click on the Smiley
void mousePressed()
{
  if(smiley.overlap(mouseX,mouseY))
  {
    laugh.rewind();
    laugh.play();
  }
}
