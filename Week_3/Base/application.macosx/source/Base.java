import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Base extends PApplet {



public void setup()
{
  size(300,300);
}

public void draw()
{
  background(255);
  
  fill(255,255,0);
  ellipse(150,150,50,50);
  
  fill(0);
  ellipse(140,145,5,15);
  ellipse(160,145,5,15);
  
  arc(150,155,30,30,0,PI,CHORD);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Base" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
