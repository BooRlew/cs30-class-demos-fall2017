//draw 5 cars on the screen!

void setup() {
  size(800, 800);
}

void draw() {
  background(255);
  
  //each one individually method
  drawcar(mouseX, mouseY, 200, 0);
  drawcar(mouseX, 150, 100, 125);
  drawcar(500, mouseY, 250, color(255, 0, 0) );
  drawcar(mouseY, 250, 100, color(0, 255, 0) );
  drawcar(600, mouseX, 75, color(0, 0, 255) );

  //for loop method
  //for (int x=100; x < width; x += 150) {
  //  drawcar(x, 400, 75, color(0, 0, 255) );
  //}
}

void drawcar(int x, int y, int thesize, color c) {
  // Using a local variable "offset"
  int offset = thesize/4;
  // Draw main car body
  rectMode(CENTER);
  stroke(200);
  fill(c);
  rect(x, y, thesize, thesize/2);
  // Draw four wheels relative to center
  fill(200);
  rect(x - offset, y - offset, offset, offset/2);
  rect(x + offset, y - offset, offset, offset/2);
  rect(x - offset, y + offset, offset, offset/2);
  rect(x + offset, y + offset, offset, offset/2);
}