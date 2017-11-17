// Convert the following starter code into OOP (make it a class)
// Add the following behaviours:
//   - bounceAround()   [behave like a ball, bouncing around the screen]
//   - followMouse()    [where the mouse is, so is the stickman]
//   - wasdMove()       [move the stickman with WASD keys]

Stickman evan;
Stickman caelan;
Stickman anthony;

void setup() {
  size(800, 800);
  
  evan = new Stickman(100, 100);
  caelan = new Stickman();
  anthony = new Stickman(400, 400);
}

void draw() {
  background(255);
  
  evan.followMouse();
  caelan.bounceAround();
  anthony.wasdMove();
  
  evan.display();
  caelan.display();
  anthony.display();
}

void mousePressed() {
  evan.respawn();
  caelan.respawn();
  anthony.respawn();
}