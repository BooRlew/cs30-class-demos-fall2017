void setup() {
  size(400, 400);
  print(factorial(4));
}

void draw() {
 
}

int factorial(int n) {
  if (n == 0 || n == 1) {
    return 1;
  }
  else {
    return n * factorial(n-1);
  }
}