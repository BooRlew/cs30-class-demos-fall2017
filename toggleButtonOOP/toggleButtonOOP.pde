ToggleButton button1;

void setup() {
  size(800, 800);
  button1 = new ToggleButton(100, 100, 50, 50);
  
}

void draw() {
  background(255);
  
  button1.display();
}

void mouseClicked() {
  button1.checkIfClicked();
}