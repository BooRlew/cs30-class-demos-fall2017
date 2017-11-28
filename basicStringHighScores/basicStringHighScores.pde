//String words = "100 Bob";
//String[] list = split(words, ' ');

// Writes the strings to a file, each on a separate line
String[] highScores = loadStrings("scores/nouns.txt");

println(highScores[1] + " got a high score of " + highScores[0]);