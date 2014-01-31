class Timer
{
  float triggerTime;
  float startTime;
  
  Timer(float _triggerTime)
  {
    triggerTime = _triggerTime;
  }
  
  //Reset the Clock
  void begin()
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
