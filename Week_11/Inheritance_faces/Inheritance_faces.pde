Face myFace;
Circle myCircle;
Square mySquare;

void setup()
{
  size(400,400);
  
  //Instance of the original parent class
  myFace = new Face(width/2, height/2, 100);
  
  //One object of the child class
  myCircle = new Circle(width/2, height/4, 100, color(255,255,0));
  
  //Object of the other child class
  mySquare = new Square(width/2, .75*height, 100, color(0,255,0));
}

void draw()
{
  background(255);
  
  myFace.display();
  myCircle.display();
  mySquare.display();
  
  if(myCircle.overlap(mouseX,mouseY))
  {
    if(mousePressed)
    {
      myCircle.move(mouseX,mouseY);
    }
    myCircle.changeFace();
  }
  
  if(mySquare.overlap(mouseX,mouseY) && mousePressed)
  {
    mySquare.move(mouseX,mouseY);
  }
}
