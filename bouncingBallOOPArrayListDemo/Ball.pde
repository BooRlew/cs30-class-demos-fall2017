class Ball {
  //data
  float x, y, size, dx, dy;

  //constructor
  Ball() {
    x = width/2;
    y = height/2;
    size = 100;
    dx = random(-20, 20);
    dy = random(-20, 20);
  }

  //behaviour
  void bounceBall() {
    //move ball
    x += dx;
    y += dy;

    bounceIfRequired();

    //display ball
    ellipse(x, y, size, size);
  }

  void bounceIfRequired() {
    //is it hitting the right or left side?
    if ( (x > width - size/2) || (x < 0 + size/2) ) {
      dx *= -1;
    }

    //is it hitting the top or bottom?
    if ( (y > height - size/2) || (y < 0 + size/2) ) {
      dy *= -1;
    }
  }
  
  boolean isClicked(float _x, float _y) {
    float distanceFromCenter = dist(x, y, _x, _y);
    if (distanceFromCenter < size/2) {
      return true;
    }
    else {
      return false;
    }
  }
}