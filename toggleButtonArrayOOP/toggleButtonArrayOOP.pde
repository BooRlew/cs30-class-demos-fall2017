ToggleButton[] buttons;
int numberOfButtons;

void setup() {
  size(800, 800);

  numberOfButtons = 10;
  buttons = new ToggleButton[numberOfButtons];

  for (int i=0; i<buttons.length; i++) {
    buttons[i] = new ToggleButton(100, i*75+25, 50, 50);
  }
}

void draw() {
  background(255);

  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
  }

  if (buttons[1].isSelected) {
    println("Music is on!");
  } else {
    println("Music is off.");
  }
}

void mouseClicked() {
  for (int i=0; i<buttons.length; i++) {
    buttons[i].checkIfClicked();
  }
}