//use logarithms to "ease in"

float theta = 0.01;
float x = 0;
float targetX = 600;

void setup() {
  size(900, 900);
}

void draw() {
  background(255);

  if (x < targetX) {
    x = log(theta);
    x = map(x, -3, 0, 0, targetX);
  }

  fill(0);
  ellipse(x, 600, 50, 50);
  theta += 0.01;
}