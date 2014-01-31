//loadStrings() brings a file in as an array of Strings
//Every line break is a new String in the array
String[] myText = loadStrings("myFile.txt");

for(int i = 0; i < myText.length; i++)
{
  println(myText[i]);
}
