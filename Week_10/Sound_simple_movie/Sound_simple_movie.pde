import processing.video.*;

//Use movie object to playback sound
Movie sound;

void setup()
{
  size(100,100);
  
  //load sound file into Movie.  You can ONLY use .wav or .aif
  sound = new Movie(this, "Hitme.wav");

}

void draw()
{
  
}

void mousePressed()
{ 
  //use stop() to go back to the beginning of the file
  sound.stop();
  //play() will start playback
  sound.play();
}

