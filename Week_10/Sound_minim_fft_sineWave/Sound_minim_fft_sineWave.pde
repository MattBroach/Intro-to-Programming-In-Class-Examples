//Analysis library allows us to do FFT analysis
import ddf.minim.analysis.*;
import ddf.minim.*;
//signals library allows us to do sound synthesis
import ddf.minim.signals.*;

Minim minim;
FFT fft;

AudioOutput out;

//SineWave object makes a sine sound
SineWave sine;

float frequency = 440;


void setup()
{
  size(512,400);
  
  minim = new Minim(this);
  
  fft = new FFT(2048,44100);
  
  //connection to sound output.  Arguments are connection type and buffer size
  out = minim.getLineOut(Minim.STEREO,2048);
  
  sine = new SineWave(frequency,.5,out.sampleRate());
  
  out.addSignal(sine);
  
  rectMode(CORNERS);
}

void draw()
{
  background(255);
  fill(0);
 
  //Analyze the sound in the buffer
  fft.forward(out.mix);
  //Draw a rectangle for each frequency band
  for(int i = 0; i < fft.specSize(); i+= 2)
  {
    rect(i,height,i+2,height - fft.getBand(i)*4);
  }

}
  

//Press UP arrow to increase sine wave frequency
//Press DOWN arrow to decrease sine wave frequency
void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == UP)
    {
      frequency *= 1.5;
    }
    if(keyCode == DOWN)
    {
      frequency /= 1.5;
    }
  }
  sine.setFreq(frequency);
  println(frequency);
}

void stop()
{
  out.close();
  minim.stop();
  super.stop();
}
