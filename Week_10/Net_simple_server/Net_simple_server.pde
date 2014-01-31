//import net library for communicating over the network
import processing.net.*;

//Make a server object
Server myServer;

int data = 0;

void setup()
{
  size(400,400);
  
  //Server constructor takes two arguments: this and port #
  myServer = new Server(this, 9876);
}

//erverEvent only happens when a new client connects.
void serverEvent(Server myServer, Client myClient)
{
  //ip() returns the client's IP address
  println("A new client as connected from " + myClient.ip());
}

void draw()
{
  //make a client to receive incoming data
  Client myClient = myServer.available();
  
  //if data is received, print it out
  if(myClient != null)
  {
    println("Incoming: " + myClient.readString());
  }
  
  data = (data+1)%255;
  
  //Write data, which is incrimenting between 1 and 255, to the client
  myServer.write(data);
}
