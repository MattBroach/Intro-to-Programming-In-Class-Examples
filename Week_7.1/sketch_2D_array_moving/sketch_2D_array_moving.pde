float[][] grid;
int rows;
int cols;

float theta;

float cellSize = 20;

void setup()
{
  size(400,400);
  
  rows = floor(width/20);
  cols = floor(height/20);
  
  theta = 0;
  
  grid = new float[rows][cols];
  
  for(int p = 0; p < rows; p++)
  {
    for(int q = 0; q < cols; q++)
    {
      grid[p][q] = 126*(cos(theta)*+1);
      theta += .1;
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
      grid[p][q] += 1;
      if(grid[p][q] > 255)
      {
        grid[p][q] = 0;
      }
    }
  }
}
