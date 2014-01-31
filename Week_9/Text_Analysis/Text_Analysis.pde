PFont myFont;

String[] poems;

//All of the possible punctuation for spliiting words
String delimiters = " ,.?!;:()&\"";

int countLength = 10;

//Arrays to save the top Ten words and their corresponding wordcounts
String[] topTenWords = new String[countLength];
int[] topTenCount = new int[countLength];

int wordIndex = 0;

void setup()
{
  size(400,400);
  
  myFont = loadFont("Baskerville.vlw");
  
  //Load the full text
  String[] raw = loadStrings("walt.txt");
  //Join all the individual lines into one long string
  String fullText = join(raw," ");
  //Separate that string into individual words, based on all the possible delimiters
  poems = splitTokens(fullText,delimiters);
  
  //Initialize the top Ten to all the first ten words in the poem
  for(int i = 0; i < topTenWords.length; i++)
  {
    topTenWords[i] = poems[i];
    topTenCount[i] = 0;
  }
}

void draw()
{
  background(255);
  
  if(wordIndex < poems.length)
  {
    //Choose a word in the text
    String current = poems[wordIndex];
    int count = 0;
    
    //Count how many times that word appears
    for(int i = 0; i < poems.length; i++)
    {
      if(current.equals(poems[i]))
      {
        count++;
      }
    }
    
    //Check to see if that word is greater than any of the words in the top ten
    //If it isn't, shift the others words down and add that word
    int index = topTenWords.length - 1;
    while((index >= 0) && (!hasWord(topTenWords,current)))
    {
      if(count > topTenCount[index])
      {
        for(int i = 0; i < index; i++)
        {
          topTenCount[i] = topTenCount[i+1];
          topTenWords[i] = topTenWords[i+1];
        }
        
        topTenCount[index] = count;
        topTenWords[index] = current;
      }
      index--;
    }
    
    //Advance to the next word
    wordIndex++;
  
    //Show the current word being analyzed
    textFont(myFont);
    fill(0);
    text(current + ": " + count, 15,15);
    fill(127);
    rect(15,20,count/40,10);
    
  }
  
  //Show current top ten
  for(int i = 0; i < topTenCount.length; i++)
  {
    fill(0);
    text(topTenWords[i] + ": " + topTenCount[i], 15,45+i*30);
    fill(127);
    rect(15,50+i*30,topTenCount[i]/40,10);
  }
  
  //Show precentage of the way through the text
  fill(0);
  text("Progress:",15,370);
  noFill();
  rect(15,375,370,15);
  fill(127);
  rect(15,375,map(wordIndex,0,poems.length,0,370),15);
  
}

//Function to check if a certain word/string is in an Array of Strings
boolean hasWord(String[] set, String check)
{
  for(int i = 0; i < set.length; i++)
  {
    if(check.equals(set[i]))
    {
      return true;
    }
  }
  
  return false;
}
    
