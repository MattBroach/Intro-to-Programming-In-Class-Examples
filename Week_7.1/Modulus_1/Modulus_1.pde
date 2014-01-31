float backColor = 0;

void setup()
{
  size(400,400);
}

void draw()
{
  background(backColor % 255);
  backColor++;
}
