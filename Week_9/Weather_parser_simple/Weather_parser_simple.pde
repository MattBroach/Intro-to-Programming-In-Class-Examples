String[] weather;
String shortened;

void setup()
{
  size(400,400);
  
  //pulling raw weather data as a string instead of a JSON file
  weather = loadStrings("http://api.openweathermap.org/data/2.5/weather?q=Burbank,us&units=imperial");
  shortened = weather[0];
}

void draw()
{
  println(float(parse(shortened,"temp\":",",")));
}

//function for finding data with a String
//based on start and end strings
String parse(String s, String start, String end)
{
  //Error checking: making sure the start and end strings actually ARE present
  if((s.indexOf(start)==-1) || (s.indexOf(end)==-1))
  {
    return "";
  }
  else
  {
    //find the index of the start String
    int startIndex = s.indexOf(start);
    //find the index of the end string -- making sure to start after the index
    //of the start String
    int endIndex = s.indexOf(end,startIndex);
    //Shift start index to immediately after the end of the start String
    startIndex += start.length();
    //get the substring from startIndex to endIndx: aka the desired string
    return s.substring(startIndex,endIndex);
  }
}
  
