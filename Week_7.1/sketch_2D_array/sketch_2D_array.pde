float[][] grid;
int rows;
int cols;

float cellSize = 20;

void setup()
{
  size(400,400);
  
  rows = floor(width/20);
  cols = floor(height/20);
  
  grid = new float[rows][cols];
  
  for(int p = 0; p < rows; p++)
  {
    for(int q = 0; q < cols; q++)
    {
      grid[p][q] = 255-dist(p*cellSize, q*cellSize, width/2, height/2);
    }
  }
}

void draw()
{
  for(int p = 0; p < rows; p++)
  {
    for(int q = 0; q < cols; q++)
    {
      fill(grid[p][q]);
      rect(p*cellSize,q*cellSize,cellSize,cellSize);
    }
  }
}
