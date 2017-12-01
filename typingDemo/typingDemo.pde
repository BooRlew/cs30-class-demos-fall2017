String name;

void setup() {
  size(600, 600);
  name = "";
}

void draw() {
  background(0);
  fill(255);
  textSize(32);
  text(name, 20, height/2);
}

void keyPressed() {
  if (name.length() < 3) {
    name += key;
  }
}