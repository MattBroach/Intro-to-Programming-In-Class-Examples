//Built in Processing object for reading/parsing XML
XML weather;

PFont myFont;

void setup()
{
  size(400,400);
  
  myFont = loadFont("Frut-50.vlw");
  
  //load local or remote XML file
  weather = loadXML("http://weather.yahooapis.com/forecastrss?w=2442047&u=f");
}

void draw()
{
  background(255);
  
  textAlign(CENTER);
  textFont(myFont);
  
  int temp = getTemp(weather);
  
  translate(width/2,height/2);
  noFill();
  ellipse(0,0,temp*2,temp*2);
  
  fill(0);
  textSize(temp/4);
  text(temp,0,0);
  
  translate(0,180);
  text(getDate(weather),0,0);
  
}

String getDate(XML xml)
{
  //getChild returns a specified child of the current XML object
  XML channel = xml.getChild("channel");
  XML item = channel.getChild("item");
  XML date = item.getChild("pubDate");
  
  //get Content returns the content of an XML Element
  return date.getContent();
}

int getTemp(XML xml)
{
  XML channel = xml.getChild("channel");
  XML item = channel.getChild("item");
  XML condition = item.getChild("yweather:condition");
  
  //getInt returns an int from an XML Attribute
  return condition.getInt("temp");
}
  
void mousePressed()
{
  weather = loadXML("http://weather.yahooapis.com/forecastrss?w=2442047&u=f");
}
