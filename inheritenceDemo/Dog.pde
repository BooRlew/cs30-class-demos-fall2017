class Dog extends Animal {
  color hairColor;
  
  Dog() {
    super();
    hairColor = color(random(0, 255));
  }

  // overriding a parent function
  void eat() {
    float choice = random(0, 100);
    if (choice < 50) {
      println("Slurp");
    } else {
      super.eat();
    }
  }

  // unique to a dog
  void bark() {
    println("WOOF!");
  }
}