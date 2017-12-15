//Timer adding objects demo

ArrayList<Ball> theBalls = new ArrayList<Ball>();
Timer theTimer;

void setup() {
  size(600, 600);
  theTimer = new Timer(1000);
  //theBalls.add(new Ball());
}

void draw() {
  background(255);

  //add new ball if needed
  if (theTimer.isFinished() ) { //&& theBalls.size() < 5) {
    theBalls.add(new Ball());
    theTimer.begin();
  }

  for (Ball thisBall : theBalls) {
    thisBall.bounceBall();
  }
}