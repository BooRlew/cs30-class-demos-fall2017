//grandfather clock visualization

float theta = 0;

void setup() {
  size(900, 900);
}

void draw() {
  background(255);
  
  //float x = (sin(theta)+1)*width/2;
  float x = sin(theta);
  x = map(x, -1, 1, 0, width);
  
  fill(0);
  ellipse(x, 600, 50, 50);
  line(width/2, 0, x, 600);
  theta += 0.05;
}