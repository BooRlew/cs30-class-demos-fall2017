//PVector demo

PVector location, velocity, acceleration, dir;
PImage fish;

void setup() {
  size(600, 600);
  location = new PVector(width/2, height/2);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);
  dir = new PVector(1, 0);
  fish = loadImage("fish.png");
}

void draw() {
  background(255);
  moveFish();
  displayFish();
}

void moveFish() {
  location.add(velocity);
  velocity.add(acceleration);
  acceleration.set(0, 0);
  
  //friction slows the fish down...
  velocity.div(1.01);
}

void displayFish() {
  imageMode(CENTER);
  pushMatrix();
    translate(location.x, location.y);
    rotate(dir.heading());
    image(fish, 0, 0);
  popMatrix();
}

void keyPressed() {
  if (keyCode == LEFT) {
    dir.rotate(-0.1);
  }
  else if (keyCode == RIGHT) {
    dir.rotate(0.1);
  }
  else if (keyCode == UP) {
    PVector thrust = new PVector();
    thrust = dir.copy();
    thrust.normalize();
    thrust.mult(2);
    acceleration = thrust;
  }
}