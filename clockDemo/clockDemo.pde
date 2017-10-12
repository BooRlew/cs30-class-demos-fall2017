

void setup() {
  size(800, 800);
}

void draw() {
  background(255);

  displayFace();
}

void displayFace() {
  translate(width/2, height/2);

  //exterior circle
  strokeWeight(7);
  fill(255);
  ellipse(0, 0, width*0.9, width*0.9);

  //center dot
  fill(0);
  strokeWeight(1);
  ellipse(0, 0, width*0.005, width*0.005);


  //second hand tick marks
  for (int i=0; i<60; i++) {
    rotate(radians(360/60));
    strokeWeight(5);
    stroke(0);
    line(width*0.33, 0, width*0.40, 0);
  }
  
  //hour tick marks
  for (int i=0; i<12; i++) {
    rotate(radians(360/12));
    strokeWeight(10);
    stroke(0);
    line(width*0.30, 0, width*0.40, 0);
  }
}