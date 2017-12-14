//ideas from https://processing.org/tutorials/pvector/

PVector location, velocity, acceleration;

void setup() {
  size(600, 600);
  location = new PVector(width/2, height/2);
  velocity = new PVector(0, 0);
  //acceleration = new PVector(-0.001, 0.01);
}

void draw() {
  background(255);
  
  //update acceleration
  PVector mouse = new PVector(mouseX, mouseY);
  PVector dir = PVector.sub(mouse, location);
 
  dir.normalize();
  dir.mult(0.5);
  acceleration = dir;
  
  velocity.limit(5);
  //acceleration = new PVector(random(-1, 1), random(-1, 1));
  
  //move
  velocity.add(acceleration);
  location.add(velocity);
  stayOnScreen();
  
  //display
  ellipse(location.x, location.y, 50, 50);
}

void stayOnScreen() {
  if (location.x > width) {
    location.x = 0;
  }
  else if (location.x < 0) {
    location.x = width;
  }
  
  if (location.y > height) {
    location.y = 0;
  }
  else if (location.y < 0) {
    location.y = height;
  }
  
}