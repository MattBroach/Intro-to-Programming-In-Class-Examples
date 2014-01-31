void setup()
{
  size(300,300,P3D);
}

void draw()
{
  background(255);
  
  fill(127);
  beginShape();
  for(float theta = 0; theta < 2 * PI; theta += PI/5)
  {
    vertex(width/2 + 50 * cos(theta),height/2 + 50 * sin(theta), theta * 10);
  }
  endShape(CLOSE);
}
