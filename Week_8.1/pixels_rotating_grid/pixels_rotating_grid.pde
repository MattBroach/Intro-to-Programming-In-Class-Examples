PImage yos;

//To keep track of rotation
float startTheta = 0;
float theta = 0;


//Properties of our grid
float cellSize = 20;
float numCellX;
float numCellY;

void setup()
{
  size(400,400);
  
  yos = loadImage("Yosemite.jpg");
  
  //Figure out how wide and tall our grid is
  numCellX = width/cellSize;
  numCellY = height/cellSize;
  
  noStroke();
}

void draw()
{ 
  yos.loadPixels();
  
  theta = startTheta;
  
  //Cycle through our grid
  for(int x = 0; x < numCellX; x++)
  {
    for(int y = 0; y < numCellY; y++)
    { 
      //Extra a pixel for each grid place.  Use that to fill our rect()
      int i = int(x*cellSize + y*width*cellSize);
      fill(yos.pixels[i]);
      
      //Save the current matrix state
      pushMatrix();
      
      //rotate each rect() around itself
      translate(x*cellSize + cellSize/2, y*cellSize + cellSize/2);
      rotate(theta);
      rect(0,0,cellSize,cellSize);
      
      //return to the previous matrix state
      popMatrix();
      
      theta += .01;
    }
  }
  
  startTheta += .01;

}

