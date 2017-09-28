// State Variables Demo
// Sept 28, 2017

//globals
float buttonX, buttonY, buttonWidth, buttonHeight;
float buttonTop, buttonBottom, buttonLeftSide, buttonRightSide;
float ballX, ballY, ballSize, dxBall, dyBall;
int state;
int bounceCounter;

void setup() {
  size(800, 800);

  state = 0;
  bounceCounter = 0;

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

  //set values for ball
  ballX = width/2;
  ballY = height/2;
  ballSize = 100;
  dxBall = random(-20, 20);
  dyBall = random(-20, 20);
}

void draw() {
  background(255);
  if (state == 0) {  //start screen
    displayButton();
  } else if (state == 1) {  //bouncing ball part
    bounceBall();
    checkIfGameDone();
  } else if (state == 2) {  //ending screen
    endingScreen();
  }
}

void endingScreen() {
  background(0);
  fill(255);
  textSize(72);
  textAlign(CENTER, CENTER);
  text("Game Over", width/2, height/2);

  textSize(30);
  text("Press any key to reset the game", width/2, height/2 + 75);
}

void checkIfGameDone() {
  if (bounceCounter >= 10) {
    state = 2;
  }
}

void bounceBall() {
  //move ball
  ballX += dxBall;
  ballY += dyBall;

  bounceIfRequired();
  displayBounces();

  //display ball
  ellipse(ballX, ballY, ballSize, ballSize);
}

void displayBounces() {
  textAlign(LEFT);
  textSize(32);
  text(bounceCounter, 25, 50);
}

void bounceIfRequired() {
  //is it hitting the right or left side?
  if ( (ballX > width - ballSize/2) || (ballX < 0 + ballSize/2) ) {
    dxBall *= -1;
    bounceCounter++;
  }

  //is it hitting the top or bottom?
  if ( (ballY > height - ballSize/2) || (ballY < 0 + ballSize/2) ) {
    dyBall *= -1;
    bounceCounter++;
  }
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
  if (state == 2) { //if on ending screen
    state = 0;
    bounceCounter = 0;
  }
}