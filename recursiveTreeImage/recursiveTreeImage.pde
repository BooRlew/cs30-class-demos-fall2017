float theta;

void setup() {
  size(800, 600);
}

void draw() {
  background(255);
  float h = height-mouseY;
  float angle = map(mouseX, 0, width, 0, 90);
  theta = radians(angle);
  
  translate(width/2, height);
  line(0, 0, 0, -h);
  
  translate(0, -h);
  branch(h);
}

void branch(float h) {
  h *= 0.6;
  
  if (h > 2) {
    pushMatrix(); //saving the current translate/rotate amounts
      rotate(theta);
      line(0, 0, 0, -h);
      translate(0, -h);
      branch(h);
    popMatrix(); //reverting to the old translate/rotate amounts
    
    pushMatrix(); //saving the current translate/rotate amounts
      rotate(-theta);
      line(0, 0, 0, -h);
      translate(0, -h);
      branch(h);
    popMatrix(); //reverting to the old translate/rotate amounts
  }
}