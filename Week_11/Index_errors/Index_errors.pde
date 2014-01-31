int index; 

float[] colors = new float[255];

void setup()
{
  size(200,200);
  
  //fill our array with numbers from 0 - 255
  for(int i = 0; i < colors.length; i++)
  {
    colors[i] = (float) i;
  }
  
  background(255);
}

void draw()
{
  
}

void mousePressed()
{
  background(255);
  
  //Choose a random index
  index = (int) random(300);
  println(index);
  
  //Try function checks for errors
  try
  {
    fill(colors[index]);
  }
  catch(ArrayIndexOutOfBoundsException e)
  {
    fill(255,0,0); //This will run if the index is out of bounds
  }
  catch(Exception e)
  {
    fill(0,0,255);   //This will run if another error happens
    e.printStackTrace();
  } 
  
  ellipse(width/2,height/2,100,100);
}
  
