Face[] faces = new Face[50];

void setup()
{
  size(400,400);
  
  //Makes every even index a Square, ever odd a Circle
  for(int i = 0; i < faces.length; i++)
  {
    float col = random(255);
    if(i%2==0)
    {
      faces[i] = new Square(random(width), random(height), random(10,100), color(0,col,col));
    }
    else
    {
      faces[i] = new Circle(random(width), random(height), random(10,100), color(col,col
      ,0));
    }
  }
}

void draw()
{
  background(255);
  
  for(int i = 0; i < faces.length; i++)
  {
    //Uses the specific display function for each child object
    faces[i].display();
    
    if(faces[i].overlap(mouseX,mouseY) && mousePressed)
    {
      faces[i].move(mouseX,mouseY);
    }
    
  }
}
