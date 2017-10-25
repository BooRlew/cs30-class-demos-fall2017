PImage fish;

void setup() {
  //size(800, 800);
  fullScreen();
  fish = loadImage("fish.jpg");
}

void draw() {
  background(0);

  image(fish, 0, 0);

  loadPixels();

  //loop through the pixels one at a time, nested loop
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {

      int location = x+y*width;

      float distanceFromCursor = dist(x, y, mouseX, mouseY);
  
      //hacky answer to harris' question
      
      //if (distanceFromCursor > 30) {
      //  color thisPixel = pixels[location];
      //  float r = red(thisPixel);
      //  float g = green(thisPixel);
      //  float b = blue(thisPixel);
      //  float a = distanceFromCursor;
      //  pixels[location] = color(r, g, b, a);
      //}
      
      if (distanceFromCursor > 100) {
        //set it to be black
        pixels[location] = color(0);
      }
    }
  }

  updatePixels();




  //fill(cursorLocation);
  //rect(350, 450, 100, 100);

  //fill(255);
  //textSize(26);
  //text("R: " + red(cursorLocation), 350, 600);
  //text("G: " + green(cursorLocation), 350, 650);
  //text("B: " + blue(cursorLocation), 350, 700);
}