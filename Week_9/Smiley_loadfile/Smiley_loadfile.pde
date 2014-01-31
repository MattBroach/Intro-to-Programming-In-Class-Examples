Smiley[] smileys = new Smiley[10];

void setup()
{
  size(400,400);
  
  //Save all Constructor data into a .txt file
  //each attribute is separated by ta comma
  String[] data = loadStrings("data.txt");
  
  for(int i = 0; i < smileys.length; i++)
  {
    //use split() to take each line of the String array and break it into individual pieces of data
    float[] args = float(split(data[i],","));
    
    //the text file strings, converted to floats, can now be used as constructor arguments
    smileys[i] = new Smiley(args[0],args[1],args[2],color(args[3],args[4],args[5]));
  }
}

void draw()
{
  background(255);
  
  for(int i = 0; i < smileys.length; i++)
  {
    smileys[i].drawSmiley();
  }
}  
