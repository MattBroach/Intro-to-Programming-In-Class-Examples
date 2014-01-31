import processing.video.*;

Movie myMovie;

void setup()
{
  size(640,360);
  myMovie = new Movie(this, "paramore.mp4");
  
  myMovie.loop();
}

void movieEvent(Movie myMovie)
{
  myMovie.read();
}

void draw()
{
  image(myMovie,0,0);
}
