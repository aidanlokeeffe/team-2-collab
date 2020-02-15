/* EXTRACT WORDS
  This program reads in a text file and produces three files--allwords.txt,
  uniquewords.txt, and wordfrequency.txt.
  
  FOR FUTURE USE: Modify the writer function to take in an output directory instead of
  hardcoding that as done below
*/

import java.util.HashSet;
import java.util.Set;
import java.util.Map;
import java.util.Arrays;

void setup() {
  // First, create the file allwords.txt
  writeAllWords("hendrix2.txt", "allwords.txt");
  
  // Only after the step above does allwords.txt exist. Now, create the file
  // uniquewords.txt;
  writeUniqueWords("allwords.txt", "../a3_novelvisualization/uniquewords.txt");
  
  // Finally, get the frequencies
  writeWordFrequency("allwords.txt", "../a3_novelvisualization/uniquewords.txt",
  "../a3_wordfrequency/wordfrequency.txt");
  
  
  
  
  
}

// Intakes a textfile, creates the file allwords.txt in this directory
void writeAllWords(String inFile, String outFile) {
  PrintWriter output = createWriter(outFile);
  
  // Load in the file
  String[] fileLines = loadStrings(inFile);
  
  // Process all lines per specificaitons, and print as you go
  for(int i=0; i < fileLines.length; i++) {   
    String[] lineWords = cleanString(fileLines[i]);
    
    for(int j=0; j < lineWords.length; j++) {
      if(lineWords[j] != "") {
        output.println(lineWords[j]);
      }
    }
  }
  output.flush();
  output.close();
  
  return;
}

// Helper to writeAllWords
String[] cleanString(String inStr) {
  // Initial processing
  inStr = inStr.trim();
  inStr = inStr.toLowerCase();
  
  // Keep only alphanumerics and spaces
  String noPunct = "";
  for(int i=0; i < inStr.length(); i++) {
    char ch = inStr.charAt(i);
    
    boolean validChar = Character.isLetter(ch);
    validChar = validChar || Character.isDigit(ch);
    validChar = validChar || ch == ' ';
    if(validChar) {noPunct += ch;}
  }
  
  // String has been processed, return word array
  return noPunct.split(" ");
}


// Writes the function uniquewords.txt
void writeUniqueWords(String allFile, String outFile) {
  PrintWriter output = createWriter(outFile);
  
  String[] allWords = loadStrings(allFile);
  
  // Initialize word set
  HashSet<String> uniqueWordSet = new HashSet<String>();
  
  // Load words into wordSet
  for(int i=0; i<allWords.length; i++) {
    uniqueWordSet.add(allWords[i].trim());
  }
  
  // Write unique words to the file
  String [] uniqueWordArray = uniqueWordSet.toArray(new String[uniqueWordSet.size()]);
  for(int i=0; i<uniqueWordArray.length; i++) {
    output.println(uniqueWordArray[i]);
  }
  output.flush();
  output.close(); 
  
  return;
}

void writeWordFrequency(String allFile, String uniqueFile, String outFile) {
  PrintWriter output = createWriter(outFile);
  
  // Get a hash map of word frequencies
  Map<String, Integer> wordCounts = tallyWords(allFile, uniqueFile);
  println(wordCounts);
  
  // Get a hash map of frequency counts
  Map<Integer, Integer> freqCounts = tallyFrequencies(uniqueFile, wordCounts);
  println(freqCounts);
  
  // Get an array of frequency keys and sort it
  Integer[] freqKeys = new Integer[freqCounts.keySet().size()];
  freqCounts.keySet().toArray(freqKeys);
  Arrays.sort(freqKeys);
  
  // Print results
  for(int i=0; i < freqKeys.length; i++) {
    String keyStr = Integer.toString(freqKeys[i]) + ": ";
    String entryStr = Integer.toString(freqCounts.get(freqKeys[i]));
    output.println(keyStr + entryStr);
  }
  output.flush();
  output.close();
  
  return;  
}

// A helper for writeWordFrequency, gets the word frequencies
Map<String, Integer> tallyWords(String allFile, String uniqueFile) {
  Map<String, Integer> outDict = new HashMap();
  
  // Use uniqueFile to parse allFile
  String[] keyArray = loadStrings(uniqueFile);
  String[] allArray = loadStrings(allFile);
  
  // Never forget that whitespace can be an issue
  // Better to trim once here then (keyArray.length) times in the tallying loop
  for(int i=0; i < allArray.length; i++) {
    allArray[i] = allArray[i].trim();
  }
  
  for(int i=0; i < keyArray.length; i++) {
    keyArray[i] = keyArray[i].trim();
    
    // Initialize the entry for the key in question
    outDict.put(keyArray[i], 0);
    
    for(int j=0; j < allArray.length; j++) {
      if( keyArray[i].equals(allArray[j]) ) {
        int oldVal = outDict.get(keyArray[i]);
        outDict.put(keyArray[i], oldVal + 1);
      }
    }
  }
  
  return outDict;
}

Map<Integer, Integer> tallyFrequencies(String inFile, Map<String, Integer> inDict) {
  Map<Integer, Integer> outDict = new HashMap();
  
  String[] keyArray = loadStrings(inFile);
  for(int i=0; i < keyArray.length; i++) {
    keyArray[i] = keyArray[i].trim();
    
    int currentKey = inDict.get(keyArray[i]);
    if ( !outDict.keySet().contains(currentKey) ) {
      outDict.putIfAbsent(currentKey, 1);
    }
    else {
      int oldVal = outDict.get(currentKey);
      outDict.put(currentKey, oldVal + 1);
    } 
  }

  return outDict;
}
