float houseX, houseY;
float smokeChange = 0;
float smokeColor = 126;
float shift;

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
  fill(0);
  rect(houseX-25,houseY+10,15,40);

  //Draw Window
  fill(255);
  ellipse(houseX+25,houseY,20,20);
  strokeWeight(5);
  line(houseX+17,houseY,houseX+33,houseY);
  line(houseX+25,houseY-8,houseX+25,houseY+8);

  //Draw Smoke
  shift = random(-10,10);
  fill(smokeColor);
  stroke(smokeColor);
  strokeWeight(0);
  ellipse(houseX+30+shift,houseY-60-smokeChange,30,10);
  smokeChange = smokeChange + 1;
  smokeColor = smokeColor + 5;

  //Draw roof
  fill(0);
  strokeWeight(1);
  stroke(0);
  rect(houseX+30,houseY-50,10,20);
  fill(142,87,31);
  triangle(houseX-50,houseY-30,houseX+50,houseY-30,houseX,houseY-60);
}
