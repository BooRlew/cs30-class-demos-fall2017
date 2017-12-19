PImage mario;
boolean facingEast;

void setup() {
  size(600, 600);
  mario = loadImage("mario.png");
  imageMode(CENTER);
  facingEast = true;
}

void draw() {
  background(255);
  
  if (facingEast) {
    translate(mouseX, mouseY);
    image(mario, 0, 0);
  }
  else {
    pushMatrix();
      translate(mouseX, mouseY);
      scale(-1, 1);
      image(mario, 0, 0);
    popMatrix();
  }
}

void keyPressed() {
  if (key == 'd') {
    facingEast = true;
  }
  else if (key == 'a') {
    facingEast = false;
  }
}