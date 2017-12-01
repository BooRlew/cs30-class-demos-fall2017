// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 22-1: Inheritance

// Object oriented programming allows us to defi ne classes in terms of other classes.
// A class can be a subclass (aka " child " ) of a super class (aka "parent").
// This is a simple example demonstrating this concept, known as "inheritance."

Shape[] shapes;

void setup() {
  size(600, 600);
  smooth();

  shapes = new Shape[60];

  for (int i=0; i<shapes.length; i++) {
    float choice = random(0, 100);

    if (choice < 33) {
      shapes[i] = new Square(random(width), random(height), random(10, 50));
    } else if (choice < 66) {
      shapes[i] =  new Circle(random(width), random(height), random(10, 50), color(random(255)));
    } else {
      shapes[i] = new Line(random(width), random(height), random(width), random(height));
    }
  }
}

void draw() {
  background(255);

  for (int i=0; i<shapes.length; i++) {
    shapes[i].jiggle();
    shapes[i].display();
    shapes[i].showNumber();
  }

}