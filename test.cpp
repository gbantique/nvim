#include <iostream>
#include <string.h>

void greet(std::string msg) {
  std::cout << msg;
}

void greeter(std::string msg, std::string name) {
  std::cout << msg << " " << name;
}

int main() {
  // std::cout << "Hello, c++";
  greet("Hello! from c++ programming language.\n");
  greet("-------------------------------------\n");
  greet("Hello");
  greeter("Hello", "Kyle");
  return 0;
}
