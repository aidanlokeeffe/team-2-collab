
// initializes background and canvas size
void setup() {
  size(700, 600);
  background(255, 255, 255);
}

void draw() {
  String[] lines = loadStrings("wordfrequency.txt");
  int[] usageStats = {};
  int max = 0;
  //grabs the values in order of usage and turns String into int
  //and finds the max value from the list for horizontal scaling purposes
  for (int i = 0; i < lines.length; i++){
      String [] removeCount = split(lines[i], ": ");
      usageStats = append(usageStats, Integer.parseInt(removeCount[1]));
      if (usageStats[i] > max){
        max = usageStats[i];
      }
  }
  //determines height of rectangle
  float heightRect = 600 / usageStats.length;
  int maxY = 600;
  int maxX = 700;
  for (int i = 0; i < usageStats.length ; i++){
    //alternate colors between red and blue
    if( i % 2 == 0){
      fill(0, 0, 255);
    }
    else{
        fill(255, 0, 0);
    }
    //if the stat is the maximum extend to both ends of the screen
    if (usageStats[i] == max){
      rect(0, maxY - (heightRect*(i + 1)), maxX, heightRect);
    }
    //otherwise calculate the size of the rectangle based on the stats
    else{
      int tempX = maxX/(max/usageStats[i]);
      if (tempX < 1){
        tempX = 1;
      }
      rect(350 - (tempX/2), maxY - (heightRect*(i + 1)), tempX, heightRect);
    }
  }
  
}
