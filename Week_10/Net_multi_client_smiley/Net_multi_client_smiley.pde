import processing.net.*;

Client client;

Smiley[] smilies = new Smiley[5];

void setup()
{
  size(400,400);
  
  client = new Client(this, "127.0.0.1", 9876);
  
  smilies[0] = new Smiley(50,50,100,color(255,255,0));
  smilies[1] = new Smiley(350,50,100,color(255,255,0));
  smilies[2] = new Smiley(50,350,100,color(255,255,0));
  smilies[3] = new Smiley(350,350,100,color(255,255,0));
  smilies[4] = new Smiley(width/2,height/2,50,color(255,0,0));
}

void draw()
{
  background(255);
  
  if(client.available() > 0)
  {
    //Servers can only transmit one byte at a time
    //To get longer information, use readStringUntil
    //And give an end-of-message character
    String in = client.readStringUntil('*');
    
    //Split the incoming string into individual numbers
    float[] vals = float(splitTokens(in,",*"));
    
    //use those numbers to move the smiley
    smilies[int(vals[0])].move(vals[1],vals[2]);
  }
  
  for(int i = 0; i < smilies.length; i++)
  {
    smilies[i].drawSmiley();
    
    if((smilies[i].overlap(mouseX,mouseY)) && mousePressed)
    {
      //use new drag() method to send data out to the server
      smilies[i].drag(mouseX,mouseY,i);
    }
  }
}
    
    
