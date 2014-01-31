PFont myFont;

float r = 100;
float arc;

String message = "Oooh, look at my curves.";

void setup()
{
  size(400,400);

  myFont = loadFont("Monospaced-30.vlw");
}

void draw()
{
  background(255);
  
  textFont(myFont);
  
  //Draw the circle 
  translate(width/2,height/2);
  noFill();
  ellipse(0,0,2*r,2*r);
  
  fill(0);
  arc = 0;
  
  for(int i = 0; i < message.length(); i++)
  {
    //Cycle through each individual character in the string
    char current = message.charAt(i);
    //Get the width of that character
    float w = textWidth(current);
    
    arc += w/2;
    
    //Calculate theta based on the length of the arc
    float theta = .8*PI + arc/r;
    
    //Move to the outside of the circle, rotate and then write that letter
    pushMatrix();
    translate(r*cos(theta), r*sin(theta));
    rotate(theta+PI/2);
    text(current,0,0);
    popMatrix();
    
    arc += w/2;
  }
}
