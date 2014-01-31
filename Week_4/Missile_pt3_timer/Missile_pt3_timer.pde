Timer timer;

void setup()
{
  size(400,400);
  
  timer = new Timer(3000);
  timer.start();
}

void draw()
{
  if(timer.isFinished())
  {
    background(random(255),random(255),random(255));
    
    timer.start();
  }
}

class Timer
{
  float triggerTime;
  float startTime;
  
  Timer(float _triggerTime)
  {
    triggerTime = _triggerTime;
  }
  
  //Reset the Clock
  void start()
  {
    startTime = millis();
  }
  
  //Return true if the elapsed time has passed, otherwise false
  boolean isFinished()
  {
    if(millis() - startTime > triggerTime)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}
