Dog fido;
Cat garfield;

void setup() {
  size(600, 600);
  fido = new Dog();
  garfield = new Cat();
  
  fido.eat();
  fido.sleep();
  fido.bark();
  
  garfield.eat();
}

void draw() {
  
}