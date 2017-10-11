//clickable button demo
// for Shao
// Sept 20, 2017

//globals
float buttonX, buttonY, buttonWidth, buttonHeight;
float buttonTop, buttonBottom, buttonLeftSide, buttonRightSide;
int state;

void setup() {
  size(800, 800);
  state = 0;

  //declare where the button should be
  buttonX = 100;
  buttonY = 300;
  buttonWidth = 600;
  buttonHeight = 200;

  //calculate sides of button
  buttonTop = buttonY;
  buttonBottom = buttonY + buttonHeight;
  buttonLeftSide = buttonX;
  buttonRightSide = buttonX + buttonWidth;
}

void draw() {
  if (state == 0) {
    background(255);
    displayButton();
  } else {
    drawCrazyStuff();
  }
}

void drawCrazyStuff() {
  noStroke();
  fill(random(255), random(255), random(255), random(255));
  ellipse(random(width), random(height), random(50), random(50));
}

boolean mouseInLocation1() {
  return mouseIsWithin(0, 0, 200, 200);
}

boolean mouseIsWithin(float leftSide, float rightSide, float top, float bottom) {
  return ((mouseX > leftSide) &&
    (mouseX < rightSide) &&
    (mouseY > top) &&
    (mouseY < bottom));
}

boolean mouseIsOnButton() {
  return ((mouseX > buttonLeftSide) &&
    (mouseX < buttonRightSide) &&
    (mouseY > buttonTop) &&
    (mouseY < buttonBottom));
}

void displayButton() {
  if (mouseIsOnButton() ) {
    fill(255, 0, 0);
  } else {
    fill(0);
  }
  rect(buttonX, buttonY, buttonWidth, buttonHeight);
}

void mousePressed() {
  if (mouseIsOnButton()) {
    background(255);
    state = 1;
  }
}

void keyPressed() {
  state = 0;
}