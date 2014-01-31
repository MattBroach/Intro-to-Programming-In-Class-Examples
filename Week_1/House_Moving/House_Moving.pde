void setup()
{
  //Set Window Attributes
  size(200,200);
  
  //Set shape Modes
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw()
{
  //Erase screen, set to white
  background(255);

  //Draw House Body
   stroke(0);
  fill(150,0,0);
  rect(mouseX,mouseY,100,60);

  //Draw Door
  fill(0);
  rect(mouseX-25,mouseY+10,15,40);

  //Draw Window
  fill(255);
  ellipse(mouseX+25,mouseY,20,20);
  strokeWeight(5);
  line(mouseX+17,mouseY,mouseX+33,mouseY);
  line(mouseX+25,mouseY-8,mouseX+25,mouseY+8);

  //Draw roof
  fill(0);
  strokeWeight(1);
  rect(mouseX+30,mouseY-50,10,20);
  fill(142,87,31);
  triangle(mouseX-50,mouseY-30,mouseX+50,mouseY-30,mouseX,mouseY-60);
}
