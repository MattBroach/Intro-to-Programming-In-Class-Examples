//Import the processing net library to communicate over the network
import processing.net.*;

//Make a client object to send and receive data
Client myClient;

int data;

void setup()
{
  size(400,400);
  
  //Client() takes three arguments: this, IP address of server, and port #
  myClient = new Client(this, "127.0.0.1", 9876);
  
  rectMode(CENTER);
}

void draw()
{
  //Check for incoming data
  if(myClient.available() > 0)
  {
    //if data has come in, read it with read()
    data = myClient.read();
  }
  
  background(255);
  
  //use the incoming data (1 byte) to change the rectangle
  fill(data);
  translate(width/2,height/2);
  rotate(map(data,0,255,0,2*PI));
  rect(0,0,200,200);
}
  
