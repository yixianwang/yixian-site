+++
title = 'C++ Const'
date = 2024-03-31T02:34:50-04:00
+++

## c++ const
- [link](https://www.geeksforgeeks.org/const-keyword-in-cpp/)

```c++
  // value of x and y can be altered
  // x = 9; y = 'A';
  // value of i and j can be altered
  // i = &m; j = &n;
  // !!! value of *i and *j cannot be altered
  // *i = 6; *j = 7; // read-only variable is not assignable
  const int* i = &x;
  const char* j = &y;

  // value of x and y can be altered
  // x = 9; y = 'A';
  // !!! value of i and j cannot be altered
  // i = &m; j = &n; // variable 'i' and 'j' declared const here
  // value of *i and *j can be altered
  // *i = 6; *j = 'A';
  int* const i = &x;
  char* const j = &y;

  // value of x and y can be altered
  // x = 9; y = 'A';
  // !!! value of i and j cannot be altered
  // i = &m; j = &n;
  // !!! value of *i and *j cannot be altered
  // *i = 6; *j = 7;
  const int* const i = &x;
  const char* const j = &y;
```

The compile-time error that will appear as if const value is passed to any non-const argument of the function
```c++
// error: no matching function for call to 'foo'
// candidate function not viable: 1st argument ('const int *') would lose const qualifier
int foo(int* y) {
  return *y;
}
 
int main() {
  int z = 8;
  const int* x = &z;
  std::cout << foo(x) << std::endl;
  return 0;
}
```

```c++
// Function foo() with variable
// const int
void foo(const int y) {
  // y = 6; const value
  // can't be change
  cout << y;
}
 
// Function foo() with variable int
void foo1(int y) {
  // Non-const value can be change
  y = 5;
  cout << '\n'
       << y;
}
 
// Driver Code
int main() {
  int x = 9;
  const int z = 10;

  foo(z);
  foo1(x);

  return 0;
}
```

const return
```c++
// int foo(int y) { // no error
// const int foo(int y) { // no error
const int foo(const int y) { // error: cannot assign to variable 'y' with const-qualified type 'const int'
  --y; 
  return y;
}
 
int main() {
  int x = 9;
  const int z = 10;
  std::cout << foo(x) << '\n'
            << foo(z);

  return 0;
}
```

An object declared as const cannot be modified and hence, can invoke only const member functions as these functions ensure not to modify the object.

When a function is declared as const, it can be called on any type of object, const object as well as non-const objects.
```c++
class Test {
 public:
  // Constructor
  Test(int v = 0) {
    value = v;
  }

  // this const means cannot modify class members, e.g. value
  // We get compiler error if we add a line like "value = 100;"
  // in this function.
  int getValue() const {
    return value;
  }
   
  // a nonconst function trying to modify value
  void setValue(int val) {
    value = val;
  }
 private:
  int value;
};
 
// Driver Code
int main() {
  // Object of the class T
  Test t(20);

  // non-const object invoking const function, no error
  cout << t.getValue() << endl;
   
  // const object
  const Test t_const(10);
 
  // const object invoking const function, no error
  cout << t_const.getValue() << endl;
 
  // const object invoking non-const function, CTE
  // t_const.setValue(15);
   
  // non-const object invoking non-const function, no error
  t.setValue(12);
   
  cout << t.getValue() << endl;

  return 0;
}
```