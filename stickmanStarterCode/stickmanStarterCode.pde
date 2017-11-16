float x, y;

void setup() {
  size(800, 800);
  
  x = width/2;
  y = height/2;
}

void draw() {
  background(255);
  
  displayStickman();
}

void displayStickman() {
    pushMatrix();
      translate(x, y);
  
      //head
      ellipse(0, 0, 50, 50);
  
      //body
      line(0, 25, 0, 100);
  
      //legs
      line(0, 100, -25, 125);
      line(0, 100, 25, 125);
  
      //arms
      line(-25, 50, 25, 50);

    popMatrix();
  }