void setup()
{

}

void draw()
{
  println(fib(5));
}

int fib(int n)
{
  if(n == 1) //End Condition 1
  {
    return 1;
  }
  else if(n == 2) //End Condition 2
  {
    return 2;
  }
  else
  {
    return fib(n-1) + fib(n -2); //Otherwise function calls itself recursively
  }
}
