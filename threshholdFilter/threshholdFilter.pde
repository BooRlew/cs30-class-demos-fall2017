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

    float brightnessLevel = brightness(thisPixel);

    if (brightnessLevel > map(mouseX, 0, width, 0, 256)) {
      //set it to be black
      pixels[i] = color(0);
    }
    else {
      //set it to be white
      pixels[i] = color(255);
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