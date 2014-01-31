PFont myFont;

String m1 = "Round and Round we go";
String m2 = "Where we'll stop, nobody knows";

float theta = 0;
float theta2 = 0;

void setup()
{
  size(400,400);
  
  myFont = loadFont("Treb.vlw");
}

void draw()
{
  background(255);
  fill(0);
  
  textFont(myFont);
  
  //Rotate and Draw first message
  pushMatrix();
  textAlign(CENTER);
  translate(width/2,height/2);
  rotate(theta);
  text(m1,0,0);
  popMatrix();
  
  //Rotate and Draw the second message
  pushMatrix();
  textAlign(CENTER);
  translate(width/2,height/2);
  rotate(theta2);
  text(m2,0,0);
  popMatrix();
  
  //increment thetas
  theta += .05;
  theta2 -= .05;
}
