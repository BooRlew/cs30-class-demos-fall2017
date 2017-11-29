// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 22-1: Inheritance

// Object oriented programming allows us to defi ne classes in terms of other classes.
// A class can be a subclass (aka " child " ) of a super class (aka "parent").
// This is a simple example demonstrating this concept, known as "inheritance."
Square s;
Circle c;
Line theLine;

void setup() {
  size(600,600);
  smooth();
  // A square and circle
  s = new Square(75,75,10);
  c = new Circle(125,125,20,color(175));
  theLine = new Line(100, 100, 400, 400);
}

void draw() {
  background(255);
  c.jiggle();
  s.jiggle();
  theLine.jiggle();
  
  c.display();
  s.display();
  theLine.display();
}