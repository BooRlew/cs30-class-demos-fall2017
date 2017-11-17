class Stickman {
  //data
  float x, y;
  float dx, dy;
  int timeToLive;
  Timer lifeTimer;

  //constructor(s)
  Stickman() {
    x = width/2;
    y = height/2;
    dx = random(-10, 10);
    dy = random(-10, 10);
    timeToLive = int(random(1000, 10000));  //in milliseconds
    lifeTimer = new Timer(timeToLive);
    lifeTimer.begin();
  }

  Stickman(float _x, float _y) {
    x = _x;
    y = _y;
    dx = random(-10, 10);
    dy = random(-10, 10);
    timeToLive = int(random(1000, 10000));  //in milliseconds
    lifeTimer = new Timer(timeToLive);
    lifeTimer.begin();
  }

  //behaviour
  void respawn() {
    if (lifeTimer.isFinished()) {
      timeToLive = int(random(1000, 10000));
      lifeTimer.setWaitTime(timeToLive);
      lifeTimer.begin();
    }
  }
  
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
    if (lifeTimer.isFinished() == false) {
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
}