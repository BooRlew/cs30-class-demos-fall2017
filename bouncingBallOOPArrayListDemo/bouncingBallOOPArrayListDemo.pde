// State Variables Demo
// Sept 28, 2017

//globals
float buttonX, buttonY, buttonWidth, buttonHeight;
float buttonTop, buttonBottom, buttonLeftSide, buttonRightSide;

int state;
int bounceCounter;

ArrayList<Ball> theBalls = new ArrayList<Ball>();

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

  for (int i=0; i<5; i++) {
    theBalls.add( new Ball() );
  }
}

void draw() {
  background(255);
  if (state == 0) {  //start screen
    displayButton();
  } else if (state == 1) {  //bouncing ball part
    
    for (Ball thisBall : theBalls) {
      thisBall.bounceBall();
    }
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



void displayBounces() {
  textAlign(LEFT);
  textSize(32);
  text(bounceCounter, 25, 50);
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

void killBallIfRequired() {
  //iterate backwards to not skip any elements if you remove one...
  for (int i=theBalls.size()-1; i >= 0; i--) { 
    Ball thisBall = theBalls.get(i);
    if (thisBall.isClicked(mouseX,mouseY)) {
      theBalls.remove(i);
      println(theBalls.size());
    }
  }
}

void mousePressed() {
  if (mouseIsOnButton()) {
    background(255);
    state = 1;
  }
  killBallIfRequired();
}

void keyPressed() {
  if (state == 2) { //if on ending screen
    state = 0;
    bounceCounter = 0;
  }
}