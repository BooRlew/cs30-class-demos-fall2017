float rectSize;
boolean isFilledWhite;

void setup() {
  size(800, 800);
  if (width % 8 == 0) {
    rectSize = width/8;
  }
  else {
    //hacky method of making it not mess up
    //just making sure the grid doesn't leave space at the end of the 8 rows/cols
    rectSize = (width/8) + 1;
  }
  isFilledWhite = true;
}

void draw() {
  for (int x=0; x < width; x += rectSize) {
    for (int y=0; y < height; y += rectSize) {

      if (isFilledWhite) {
        fill(255);
      } else {
        fill(0);
      }

      isFilledWhite = !isFilledWhite;  //toggles back and forth between true and false
      rect(x, y, rectSize, rectSize);
    }
    //toggle at the bottom of each of the columns
    isFilledWhite = !isFilledWhite;
  }
}