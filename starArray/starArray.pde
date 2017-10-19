//to make it more interesting...

//change dy with keypress -- DONE
//each star should be a random colour -- DONE
//collision detection --


float[] x;
float[] y;
float[] dy;
color[] starColor;
int numberOfStars;
float starSize;

void setup() {
  size(800, 800);

  numberOfStars = 100;
  x = new float[numberOfStars];
  y = new float[numberOfStars];
  dy = new float[numberOfStars];
  starColor = new color[numberOfStars];
  starSize = 10;

  setRandomValues();
}

void draw() {
  background(0);
  moveStars();
  displayStars();
  checkForCollision();
}

void checkForCollision() {
  for (int i=0; i<numberOfStars; i++) {
    float distanceFromCursor = dist(x[i], y[i], mouseX, mouseY);
    if (distanceFromCursor < starSize/2) {
      //mouse is hitting one of the stars
      background(255, 0, 0);
    }
  }
}

void moveStars() {
  for (int i=0; i<numberOfStars; i++) {
    y[i] += dy[i];

    //if (x[i] > mouseX) {
    //  x[i]--;
    //}
    //else if (x[i] < mouseX) {
    //  x[i]++;
    //}

    if (y[i] > height) {
      y[i] = 0;
    }
  }
}

void displayStars() {
  for (int i=0; i<numberOfStars; i++) {
    fill(starColor[i]);
    ellipse(x[i], y[i], starSize, starSize);
  }
}

void setRandomValues() {
  for (int i=0; i<numberOfStars; i++) {
    x[i] = random(0, width);
    y[i] = random(0, height);
    dy[i] = random(1, 10);
    starColor[i] = color(random(255), random(255), random(255), random(255));
  }
}

void keyPressed() {
  if (keyCode == UP) {
    for (int counter=0; counter<numberOfStars; counter++) {
      dy[counter] *= 1.1;
    }
  } else if (keyCode == DOWN) {
    for (int counter=0; counter<numberOfStars; counter++) {
      dy[counter] *= 0.9;
    }
  }
}