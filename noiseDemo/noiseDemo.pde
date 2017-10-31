float x;
float time;

void setup() {
  size(800, 800);
  time = 0;
}

void draw() {
  background(0);
  
  fill(255);
  x = noise(time);
  x = map(x, 0, 1, 0, width);
  time += 0.01;
  
  ellipse(x, height/2, 100, 100);
}