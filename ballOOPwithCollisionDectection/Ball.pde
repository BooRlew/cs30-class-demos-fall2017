class Ball {
  //data
  float x, y, dx, dy, radius;
  
  //constructor(s)
  //Ball(float _x, float _y, float _dx, float _dy, float _radius) {
  //  x = _x;
  //  y = _y;
  //  dx = _dx;
  //  dy = _dy;
  //  radius = _radius;
  //}
  
  //another way to do the same thing...
  Ball(float x, float y, float dx, float dy, float radius) {
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.radius = radius;
  }
  
  //behaviour(s)
  void display() {
    fill(255);
    ellipse(x, y, radius*2, radius*2);
  }
  
  void move() {
    x += dx;
    y += dy;
    
    bounceIfRequired();
  }
  
  void bounceIfRequired() {
    if ( (x+radius > width) || (x - radius < 0) ) {
      dx *= -1;
    }
    if ( (y+radius > height) || (y - radius < 0) ) {
      dy *= -1;
    }
  }
  
  void checkIfCollidingWith(Ball otherBall) {
    float distanceBetweenBalls = dist(x, y, otherBall.x, otherBall.y);
    float sumOfRadii = radius + otherBall.radius;
    
    if (distanceBetweenBalls <= sumOfRadii) { //collision!
      float tempdx = dx;
      float tempdy = dy;
      
      dx = otherBall.dx;
      dy = otherBall.dy;
      
      otherBall.dx = tempdx;
      otherBall.dy = tempdy;
    }
    
  }
  
}