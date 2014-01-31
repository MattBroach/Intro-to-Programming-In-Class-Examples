//Set Window Attributes
size(200,200);
background(255);

//Set shape Modes
rectMode(CENTER);
ellipseMode(CENTER);

//Draw House Body
stroke(0);
fill(150,0,0);
rect(100,150,100,60);

//Draw Door
fill(0);
rect(75,160,15,40);

//Draw Window
fill(255);
ellipse(125,150,20,20);
strokeWeight(5);
line(117,150,133,150);
line(125,142,125,158);

//Draw roof
fill(0);
strokeWeight(1);
rect(130,100,10,20);
fill(142,87,31);
triangle(50,120,150,120,100,90);
