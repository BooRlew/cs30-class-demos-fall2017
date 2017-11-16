Timer clock;

void setup() {
  size(800, 800);
  
  clock = new Timer(3000);
  clock.begin();
}

void draw() {
  
  if ( clock.isFinished() ) {
    background(255, 0, 0);
  }
  else {
    background(0);
  }
  
}

void mousePressed() {
  clock.setWaitTime(int(random(100, 3000)));
  clock.begin();
}