class ToggleButton {
  //data
  float x, y, buttonWidth, buttonHeight;
  float leftSide, rightSide, top, bottom;
  boolean isSelected;

  //constructor(s)
  ToggleButton(float _x, float _y, float _width, float _height) {
    x = _x;
    y = _y;
    buttonWidth = _width;
    buttonHeight = _height;
    
    isSelected = false;
    leftSide = x;
    rightSide = x + buttonWidth;
    top = y;
    bottom = y + buttonHeight;
  }

  //behaviour
  void display() {
    if (isSelected) {
      fill(255, 0, 0);
    } else {
      fill(255);
    }
    rect(x, y, buttonWidth, buttonHeight);
  }

  void checkIfClicked() {
    if (mouseIsOnButton()) {
      isSelected = !isSelected;
    }
  }

  boolean mouseIsOnButton() {
    return ((mouseX > leftSide) &&
      (mouseX < rightSide) &&
      (mouseY > top) &&
      (mouseY < bottom));
  }
}