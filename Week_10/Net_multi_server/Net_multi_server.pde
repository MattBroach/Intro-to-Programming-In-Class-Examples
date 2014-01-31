import processing.net.*;

Server server;
String incomingMessage;


void setup()
{
  
  server = new Server(this, 9876);
}

void draw()
{
  background(255);
  
  Client client = server.available();
  
  if(client != null)
  {
    //Server takes in the message the client sends
    incomingMessage = client.readStringUntil('*');
    //And immediately sends it back out to all connected clients
    server.write(incomingMessage);
  }
}

void serverEvent(Server server, Client client)
{
  println("A new client has connected: " + client.ip());
}
    
