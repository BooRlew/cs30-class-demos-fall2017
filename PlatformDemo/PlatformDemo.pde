float x, y, dx, dy;
PImage fish;
float ground, gravity;

void setup() {
  size(600, 600);
  fish = loadImage("fish.png");
  ground = height - 100;
  x = width/2;
  y = ground;
  gravity = 0.5;
}

void draw() {
  background(255);
  
  //move
  x += dx;
  y += dy;
  
  //gravity
  if (y > ground) {
    y = ground;
    dy = 0;
  }
  else {
    dy += gravity;
  }
  
  //display
  imageMode(CENTER);
  image(fish, x, y);
}

void jump() {
  dy = -10;
}

void keyPressed() {
  if (key == ' ') {
    jump();
  }
}