//First, load a font using the "Tools" -> "Create Font."

//Declare a PFont object
PFont myFont;

void setup()
{
  size(400,400);
  
  //load the font using loadFont function
  myFont = loadFont("Baskerville-48.vlw");
}

void draw()
{
  background(255);
  
  //use textFont to set the current font
  textFont(myFont);
  //Fill sets the text color
  fill(0);
  //text() actually writes the text to the screen
  text("I made a message!",20,200);
}
