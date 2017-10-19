float[] x;
float[] y;
float[] dy;
int numberOfStars;

void setup() {
  size(800, 800);
  
  numberOfStars = 200;
  x = new float[numberOfStars];
  y = new float[numberOfStars];
  dy = new float[numberOfStars];
  
  setRandomValues();
}

void draw() {
  background(0);
  moveStars();
  displayStars();
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
  fill(255);
  for (int i=0; i<numberOfStars; i++) {
    ellipse(x[i], y[i], 5, 5);
  }
}

void setRandomValues() {
  for (int i=0; i<numberOfStars; i++) {
    x[i] = random(0, width);
    y[i] = random(0, height);
    dy[i] = random(1, 10);
  } 
}