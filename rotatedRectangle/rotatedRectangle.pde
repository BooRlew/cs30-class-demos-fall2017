float theta;

void setup() {
  size(400, 400);
  theta = 0;
}

void draw() {
  background(255);
  
  //theta = mouseX;
  theta += 5;
  
  translate(100, 100);
  rotate( radians(theta) );
  fill(0);
  rectMode(CENTER);
  rect(0, 0, 50, 50);
}