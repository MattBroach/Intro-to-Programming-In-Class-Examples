PFont myFont;

float theta=0;
float startTheta = 0;
float xPos = 50;

String message = "Stop the ride I'd like to get off.";

void setup()
{
  size(600,400);
  
  myFont = loadFont("Me.vlw");
}

void draw()
{
  background(255);
  fill(0);
  
  textFont(myFont);
  
  xPos = 50;
  theta = startTheta;
  
  //Loop through the entire string, and draw each character
  //Alter the size based on the sin function
  for(int i = 0; i < message.length(); i++)
  {
    textSize(40*abs(sin(theta))+5);
    text(message.charAt(i),xPos,height/2);
    
    xPos += textWidth(message.charAt(i));
    theta += .3;
  }
  
  startTheta += .01;
}
