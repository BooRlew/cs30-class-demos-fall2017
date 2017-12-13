//to use the gamepad, need to import these...
import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;

ControlIO control;
//Configuration config;  //didn't use this in this basic sketch, as I simply targeted the specific controller I have
ControlDevice gpad;

float x, y, circleSize;
float xSpeed, ySpeed;

void setup() {
  size(600, 600);
  // Initialise the ControlIO
  control = ControlIO.getInstance(this);
  // Find a device that matches the configuration file
  gpad = control.getDevice("Logitech Dual Action");
  if (gpad == null) {
    println("No suitable device configured");
    System.exit(-1); // End the program NOW! Could also just default to wasd
  }
  
  //set initial variables
  x = width/2;
  y = height/2;
  circleSize = 50;
  xSpeed = 0;
  ySpeed = 0;
}

void draw() {
  background(0);
  checkInput();
  
  
  y += ySpeed;
  x += xSpeed;
  ellipse(x, y, circleSize, circleSize);
}

void checkInput() {
  float currentPadX =  gpad.getSlider("X Axis").getValue(); //ranges from -1 to 1
  float currentPadY =  gpad.getSlider("Y Axis").getValue(); //ranges from -1 to 1
  
  xSpeed = map(currentPadX, -1, 1, -5, 5);
  ySpeed = map(currentPadY, -1, 1, -5, 5);
  
}