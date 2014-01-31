import processing.pdf.*;

float theta = 0;
float startTheta = 0;

void setup()
{
  size(400,100);
  
  beginRecord(PDF,"wave.pdf");
}

void draw()
{
  //background(255);
  
  theta = startTheta;
  
  for(int x = 0; x < width+5; x++)
  {
    //fill(0);
    ellipse(x,sin(theta)*height/2 + height/2, 10,10);
    
    theta += PI/100;
  }
  
  startTheta += 1.1;
}

void mousePressed()
{
  endRecord();
  exit();
}
