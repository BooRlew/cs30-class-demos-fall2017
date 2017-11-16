class Stickman {
  //data
  float x, y;
  float dx, dy;

  //constructor(s)
  Stickman() {
    x = width/2;
    y = height/2;
    dx = random(-10, 10);
    dy = random(-10, 10);
  }

  Stickman(float _x, float _y) {
    x = _x;
    y = _y;
    dx = random(-10, 10);
    dy = random(-10, 10);
  }

  //behaviour
  void wasdMove() {
    if (keyPressed) {
      if (key == 'w') {
        y -= abs(dy);
      }
      if (key == 's') {
        y += abs(dy);
      }
      if (key == 'a') {
        x -= abs(dx);
      }
      if (key == 'd') {
        x += abs(dx);
      }
    }
  }
  
  void bounceAround() {
    x += dx;
    y += dy;
    
    //bounce on edge
    if (x > width || x < 0) {
      dx *= -1;
    }
    if (y > height || y < 0) {
      dy *= -1;
    }
  }
  
  void followMouse() {
    x = mouseX;
    y = mouseY;
  }
  
  void display() {
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
}