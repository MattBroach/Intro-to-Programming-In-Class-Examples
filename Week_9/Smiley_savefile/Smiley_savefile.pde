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
    if(smileys[i].overlap(mouseX,mouseY) && mousePressed)
    {
      smileys[i].move(mouseX,mouseY);
    }
    smileys[i].drawSmiley();
  }
}

void saveData()
{
  String[] data = new String[smileys.length];
  
  //This is the reverse of our constructor process
  //combine all the relevant fields of each indivual object into a single string
  //and write those strings to a text file
  for(int i = 0; i < data.length; i++)
  {
    data[i] = smileys[i].x + "," + smileys[i].y + "," + smileys[i].r + "," +
              red(smileys[i].face) + "," + green(smileys[i].face) + "," + blue(smileys[i].face); 
  }
 
  //saveStrings writes the strings to a text file 
  saveStrings("data/data.txt",data);
}

void keyPressed()
{
  saveData();
}
