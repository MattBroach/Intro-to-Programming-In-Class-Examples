int[] playerScores = new int[100];
int sum;
float average;

void setup()
{
  size(300,300);
  fillArrayRandom();
}

void draw()
{
  background(255);
  
  //Calculate the Average of all the scores
  sum = 0;
  for(int i = 0; i < playerScores.length; i++)
  {
    sum += playerScores[i];
  }
  average = sum/playerScores.length;
  println(average);
  
  //draw cicle based on average player score
  ellipse(width/2,height/2,average,average);
}

void fillArrayRandom()
{
  for(int i = 0; i < playerScores.length; i++)
  {
    //need to type the variable
    playerScores[i] = int(random(100,300));
  }
}

void keyPressed()
{
  fillArrayRandom();
}
