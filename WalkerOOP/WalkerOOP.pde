Walker carlos;
Walker richard;
Walker dylan;

void setup() {
  size(800, 800);
  background(0);

  carlos = new Walker();  //call the constructor
  richard = new Walker(color(255, 0, 0));
  dylan = new Walker(100, 200, color(0,255,0));
}

void draw() {
  carlos.move();
  richard.move();
  dylan.move();
  
  carlos.display();
  richard.display();
  dylan.display();
}