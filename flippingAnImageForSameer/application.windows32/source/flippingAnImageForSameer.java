import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class flippingAnImageForSameer extends PApplet {

PImage mario;
boolean facingEast;

public void setup() {
  
  mario = loadImage("mario.png");
  imageMode(CENTER);
  facingEast = true;
}

public void draw() {
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

public void keyPressed() {
  if (key == 'd') {
    facingEast = true;
  }
  else if (key == 'a') {
    facingEast = false;
  }
}
  public void settings() {  size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "flippingAnImageForSameer" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
