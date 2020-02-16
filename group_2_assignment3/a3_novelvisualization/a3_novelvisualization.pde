PFont courier;

// initializes background, canvas size, and font information for the text
void setup() {
  size(700, 600);
  courier = createFont("Courier", 32);
  textFont(courier);
  background(114,73,32);
  drawCloud();
}

// changes canvas contents to new cloud if the mouse is pressed
void draw() {
  if (mousePressed == true) {
    background(114,73,32);
    drawCloud();
  }
}
 // draws word cloud using a rng to determine font color and a bases word location
 // on the collective width of the words already on the line
 // places word on new line if the width overlaps a buffer I set
void drawCloud() {
  String[] words = loadStrings("uniquewords.txt");
  shuffle(words);
  float txtW = 0;
  float txtH = 20;
  float rand;
  for (int w=0; w<words.length; w++) {
    rand = floor(random(3));
    if (rand == 0.0) {fill(126,206,207);}
    if (rand == 1.0) {fill(152,251,152);}
    if (rand == 2.0) {fill(255,191,0);}
    if (txtW > 500) {
      txtW = 0;
      txtH += 25;
    }
    text(words[w],txtW,txtH);
    txtW += textWidth(words[w]) + 10;
    
  }
}

// uses the fisher-yates algorithm to shuffle a string array
void shuffle (String[] toShuffle) {                
  String stringData;                               
  for (int i=0; i<toShuffle.length-1; i++) {
    int sampleSize = toShuffle.length-i;
    int rand = int(random(sampleSize));
    stringData = toShuffle[rand];
    toShuffle[rand] = toShuffle[sampleSize -1];
    toShuffle[sampleSize-1] = stringData;
  }
}
