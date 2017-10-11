int offset, spacing;

void setup() {
  size(800, 800);
  offset = 50;
  spacing = 50;
}

void draw() {
  background(0);

  for (int x = offset; x <= width-offset; x += spacing) {
    for (int y = offset; y <= height-offset; y += spacing) {
      stroke(255, 50);
      ellipse(x, y, 3, 3);
      line(mouseX, mouseY, x, y);
    }
  }
}