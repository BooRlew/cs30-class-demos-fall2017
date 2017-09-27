float timeToWait;

void setup() {
  size(600, 600);
  timeToWait = 3000;
}

void draw() {
  background(255);

  if (millis() > timeToWait) {
    fill(255, 0, 0);
  }
  else {
    fill(0);
  }
  rectMode(CENTER);
  rect(width/2, height/2, 300, 300);
}