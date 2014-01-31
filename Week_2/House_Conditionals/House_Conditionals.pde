float houseX, houseY;
float smokeChange = 0;
float smokeColor = 126;
float shift;
boolean doorOpen = false;

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
  //set house coordinates
  houseX = width/2;
  houseY = .75 * height;
  
  //Erase screen, set to white
  background(255);

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

  //Do the following only if the mouse is pressed
  if(mousePressed)
  {
    //Draw Smoke
    shift = random(-10,10);
    fill(smokeColor);
    stroke(smokeColor);
    strokeWeight(0);
    ellipse(houseX+30+shift,houseY-60-smokeChange,30,10);
    smokeChange = smokeChange + 1;
    smokeColor = smokeColor + 5;
    smokeColor = constrain(smokeColor,0,255);
    if(smokeChange > 50)  //reset the smoke if it gets above a certain height
    {
      smokeChange = 0;
      smokeColor = 127;
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

//Toggle opening and closing the door
void keyPressed()
{
  doorOpen = !doorOpen;
}
