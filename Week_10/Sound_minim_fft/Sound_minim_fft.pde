//To analyze music, we need to import the analysis library as well
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer machinedrum;

//FFT object for doing analysis
FFT fft;

void setup()
{
  size(512,400);
  
  //intitialize connection to hardware
  minim = new Minim(this);
  
  //Load mp3 and start looping playback
  machinedrum = minim.loadFile("4 Center Your Love.mp3",2048);
  machinedrum.loop();
  
  //set the FFT buffer and sample size to that off the music
  fft = new FFT(machinedrum.bufferSize(),machinedrum.sampleRate());
  
  rectMode(CORNERS);
}

void draw()
{
  background(255);
  fill(0);
  
  //does analysis on the next bit of music loaded into the buffer
  fft.forward(machinedrum.mix);
  for(int i = 0; i < fft.specSize()/8; i++)
  {
    //draw a rectange for each frequency range
    rect(i*4,height,i*4+4,height - fft.getBand(i)*4);
  }
}
