boolean doorOpen = false;
 
House[] block = new House[6];

void setup()
{
  //Set Window Attributes
  size(600,200);
  
  //Set shape Modes
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  //initiate Houses
  for(int i = 0; i < block.length; i++)
  {
    block[i] = new House(i*100+50,150,float(i+1)/5);
  }
}

void draw()
{
  //Erase previous frame, draw sky
  background(sky());
  
  //draw ground
  noStroke();
  rectMode(CORNER);
  rect(0,3*height/4 + 25,width,height/4);
  
  //Draw Houses
  for(int i=0; i < block.length; i++)
  {
    block[i].build();
    block[i].smokeChange();
  }
  
}

//Toggle opening and closing the door
void keyPressed()
{
  doorOpen = !doorOpen;
}

//reusable function to draw my house


color sky()
{
  float r = map(mouseX,0,width,152,21);
  float g = map(mouseX,0,width,204,61);
  float b = map(mouseX,0,width,255,100);
  
  return color(r,g,b);
}
