float smokeChange = 0;
float smokeAlpha = 255;
float shift;
boolean doorOpen = false;

void setup()
{
  //Set Window Attributes
  size(600,200);
  
  //Set shape Modes
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw()
{
  //Erase previous frame, draw sky
  background(sky());
  
  //draw ground
  noStroke();
  rectMode(CORNER);
  rect(0,3*height/4 + 25,width,height/4);
  
  //Set number of houses and draw them
  for(int i = 1; i < 5; i++)
  {
    drawHouse(width*i/5,3*height/4);
  }
 
  //Trigger the smoke to rise 
  smokeChange(); 
  
}

//Toggle opening and closing the door
void keyPressed()
{
  doorOpen = !doorOpen;
}

//reusable function to draw my house
void drawHouse(float houseX, float houseY)
{ 
  rectMode(CENTER);
  
  //Draw House Body
   stroke(0);
  fill(150,0,0);
  rect(houseX,houseY,100,60);

  //Draw Door
  if(doorOpen)
  {
    fill(142,87,31);
    quad(houseX-15,houseY-10,houseX-10,houseY-15,houseX-10,houseY+35,houseX-15,houseY+30);
    fill(0);
  }
  else
  {
    fill(150,0,0);
  }
  rect(houseX-25,houseY+10,20,40);

  //Set Window fill only if the mouse is over the house
  if((mouseX > houseX - 50) && (mouseX < houseX + 50) && (mouseY > houseY - 30) && (mouseY < houseY + 30))
  {
    fill(255,255,0);
  }
  else
  {
    fill(100);
  }
  
  //Draw Window
  ellipse(houseX+25,houseY,20,20);
  strokeWeight(5);
  line(houseX+17,houseY,houseX+33,houseY);
  line(houseX+25,houseY-8,houseX+25,houseY+8);

  //Do the following only if the mouse is NOT pressed
  if(!mousePressed)
  {
    //Draw Smoke
    for(int i = 0; i < 20; i += 2)
    {
      shift = random(-10,10);
      fill(127,smokeAlpha);
      noStroke();
      ellipse(houseX+30+shift,houseY-60-smokeChange-i,30,10);
    }
  }

  //Draw roof
  fill(0);
  strokeWeight(1);
  stroke(0);
  rect(houseX+30,houseY-50,10,20);
  fill(142,87,31);
  triangle(houseX-50,houseY-30,houseX+50,houseY-30,houseX,houseY-60);
}

//Cuases the smoke to rise
void smokeChange()
{
  smokeChange = smokeChange + 1;
    smokeAlpha = smokeAlpha - 5;
    smokeAlpha = constrain(smokeAlpha,0,255);
    if(smokeChange > 50)  //reset the smoke if it gets above a certain height
    {
      smokeChange = 0;
      smokeAlpha = 255;
    }
}

color sky()
{
  float r = map(mouseX,0,width,152,21);
  float g = map(mouseX,0,width,204,61);
  float b = map(mouseX,0,width,255,100);
  
  return color(r,g,b);
}
