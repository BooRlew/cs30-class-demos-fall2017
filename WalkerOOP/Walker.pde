class Walker {
  //data
  float x, y;
  color theColor;

  //constructor(s)
  Walker() {
    x = width/2;
    y = height/2;
    theColor = color(255);
  }
  
  Walker(color _theColor) {
    theColor = _theColor;
    x = width/2;
    y = height/2;
  }
  
  Walker(float _x, float _y, color _theColor) {
    x = _x;
    y = _y;
    theColor = _theColor;
  }

  //behaviour
  void move() {
    float choice = random(100);
    if (choice < 25) {  //right
      x++;
    } else if (choice < 50) { //left
      x--;
    } else if (choice < 75) { //up
      y--;
    } else { //down
      y++;
    }
  }

  void display() {
    stroke(theColor);
    point(x, y);
  }
}