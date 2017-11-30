PImage colorWheel;
color clickedColor;

void setup() {
  size(800, 800);
  colorWheel = loadImage("color-chooser.jpg");
}

void draw() {
  image(colorWheel, 0, 0);
  
  fill(clickedColor);
  rect(0, 0, 75, 75);
}

void mousePressed() {
  clickedColor = get(mouseX, mouseY);
  
  println(red(clickedColor), green(clickedColor), blue(clickedColor));
}