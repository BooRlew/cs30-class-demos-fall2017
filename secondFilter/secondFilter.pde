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
  
  //loop through the pixels one at a time, single loop
  for (int i=0; i<pixels.length; i++) {
    color thisPixel = pixels[i];
    
    //accessed the RGB values for this pixel
    float r = red(thisPixel);
    float g = green(thisPixel);
    float b = blue(thisPixel);
    
    //change the RGB values! Write your filter here...
    float newR = r*.393 + g*.769 + b*.189;
    float newG = r*.349 + g*.686 + b*.168;
    float newB = r*.272 + g*.534 + b*.131;
    
    //update pixel array
    pixels[i] = color(newR, newG, newB);
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