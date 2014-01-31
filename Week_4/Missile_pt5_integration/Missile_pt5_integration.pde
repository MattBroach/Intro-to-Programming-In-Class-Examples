int totalMissiles = 0;
int totalBullets = 0;
int playerScore = 0;

//Declare all my objects
Missile[] missiles = new Missile[1000];
Bullet[] bullets = new Bullet[1000];
Station gun;
Timer timer;

void setup()
{
  size(400,400);
  rectMode(CENTER);
  
  //Set the gun for the center of the screen
  gun = new Station(width/2);
  
  //Set the timer for every half second, then start the timer
  timer = new Timer(500);
  timer.begin();
}

void draw()
{
  //Erase Screen, draw background
  background(255);
  
  //Move and draw the gun
  gun.move(mouseX,width,0);
  gun.display();
  
  //Draw the bullets if they haven't hit a missile
  for(int i = 0; i < totalBullets; i++)
  {
    if(!bullets[i].hit)
    {
      bullets[i].display();
      bullets[i].move();
    }
  }
  
  //Start a new missile every time the timer ends, then restart the timer
  if(timer.isFinished())
  {
    missiles[totalMissiles] = new Missile(random(width), random(1,5));
  
    if(totalMissiles < missiles.length)
    {
      totalMissiles++;
    }
    else
    {
      totalMissiles = 0;
    }
    
    timer.begin();
  }
  
  //Draw Missiles and check for collisions with bullets
  for(int i = 0; i < totalMissiles; i++)
  {
    if(!missiles[i].exploded)
    {
      missiles[i].move();
      missiles[i].display();
      
      for(int p = 0; p < totalBullets; p++)
      {
        if(!bullets[p].hit)
        {
          missiles[i].hitCheck(bullets[p]);
          if(missiles[i].exploded)
          {
            p = totalBullets;
            playerScore++;
          }
        }
      }
    }
  }
  
  //Report Playerscore
  println("You have hit " + playerScore + " missiles.");
}

void keyPressed()
{
  bullets[totalBullets] = new Bullet(width/2);
  bullets[totalBullets].fire(mouseX,width,0);
  
  totalBullets++;
  
  if(totalBullets >= bullets.length)
  {
    totalBullets = 0;
  }
}
