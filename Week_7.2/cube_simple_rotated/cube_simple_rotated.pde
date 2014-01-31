float s = 50;
float thetaX = 0;
float thetaY = 0;

void setup()
{
  size(300,300,P3D);
}

void draw()
{
  background(255);
  
  translate(width/2, height/2);
  
  //Rotate around each Access
  rotateX(thetaX);
  rotateY(thetaY);
  
  beginShape(QUADS);
  
  fill(200,150);
  vertex(s, s, s);
  vertex(s, s, -s);
  vertex(s, -s, -s);
  vertex(s, -s, s);
  
  fill(200,150);
  vertex(s,s,s);
  vertex(-s,s,s);
  vertex(-s,s,-s);
  vertex(s,s,-s);
  
  fill(200,150);
  vertex(-s,s,s);
  vertex(-s,-s,s);
  vertex(-s,-s,-s);
  vertex(-s,s,-s);
  
  fill(200,150);
  vertex(-s,-s,s);
  vertex(s,-s,s);
  vertex(s,-s,-s);
  vertex(-s,-s,-s);
  
  endShape();
  
  thetaX += .01;
  thetaY += .02;
}
