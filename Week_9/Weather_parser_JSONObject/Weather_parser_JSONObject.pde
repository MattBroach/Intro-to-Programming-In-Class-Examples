//Object for storing/parsing JSON data
JSONObject weather;

PFont myFont;

void setup()
{
  size(400,400);
  
  myFont = loadFont("Frut-50.vlw");
  
  //loadJSONObject reads a local or remote JSON file
  weather = loadJSONObject("http://api.openweathermap.org/data/2.5/weather?q=NewYork,us&units=imperial");
}

void draw()
{
  background(255);
  
  textAlign(CENTER);
  textFont(myFont);
  
  println(parse(weather));
  
  
  float temp = parse(weather);
  
  translate(width/2,height/2);
  noFill();
  ellipse(0,0,temp*2,temp*2);
  
  fill(0);
  textSize(temp/4);
  text(temp,0,0);
  
}

float parse(JSONObject json)
{
  //getJSONObject returns an object WITHIN a JSON object
  JSONObject all = json.getJSONObject("main");
  //Get float returns an float within a JSON object
  float temp = all.getFloat("temp");
  
  return temp;
}
  
