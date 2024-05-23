+++
title = 'Go Syntax'
date = 2024-05-22T21:11:38-04:00
+++

## 1. workspace
`go env GOPATH`

### 1.1 file structures
- `/Users/username/go/src/project1`
- `/Users/username/go/src/project2`

## 2. package main
- every project at least if we want to be executed it needs to have a package called `package main`

## 3. import
- this is where we can import different packages
> no comma
```
import (
  "fmt"
  "math"
)
```

## 4. run go file
- `go run hello.go`

## 5. go build
- compile the code into executable
- `go build` directly

## 6. go install
- similar to `go build`	except the executable is put in **bin** folder	

## 7. pkg folder
- for external dependencies

## 8. var vs :=
```
var x int = 5
var y int = 6
var sum int = x + y

x := 5
y := 7
sum := x + y
```

## 9. if else if else
- no bracket

## 10. array
```
// approach 1 to initialize
var a [5]int

// approach 2 to initialize
a := [5]int{5,4,3,2,1}

// modify the element by index
a[2] = 11

// dynamic array(slice is backed by array)
a := []int{5,4,3,2,1}

// slices doesn't modify the original slice, it returns a new one
a = append(a, 13)
```

## 11. map
```
vertices  := make(map[string]int)
vertices["triangle"] = 1 
vertices["square"] = 2
vertices["circle"] = 3

// get 
vertices["square"]

// delete
delete(vertices, "square")
```

## 12. for
> no `++i`

### 12.1 for loop
```
for i := 0; i < 5; i++ {
  // do something
}
```

### 12.2 while loop
```
i := 0
for i < 5 {
  // do something
  i++
}
```

### 12.3 iterate array/map with range
```
// with array
arr := []string{"a", "b", "c"}
for index, value := range arr {
  fmt.Println("index", index, "value", value)
}

// with map
m := make(map[string]string)
m["a"] = "A"
m["b"] = "B"
for key, value := range m {
  fmt.Println("key", key, "value", value)
}
```

## 13. function
```
func sum(x int, y int) int {
  return x + y
}
```

### 13.1 multiple return values
```
package main

import (
  "fmt"
  "errors"
  "math"
)

func main() {
  result, err := sqrt(16)
  if err != nil {
    fmt.Println(err)
  } else {
    fmt.Println(result)
  }
}

func sqrt(x float64) (float64, error) {
  if x < 0 {
    return 0, errors.New("bla bla bla")
  }
  return math.Sqrt(x), nil
}
```

## 14. struct
```
package main

import (
  "fmt"
)

type person struct {
  name string
  age int
}

func main() {
  p := person(name: "Yixian", age: 100)
  fmt.Println(p)
  fmt.Println(p.age) // get field
}
```

## 15. pointer
```
func main() {
  i := 7
  inc(&i)
  fmt.Println(i)
}

func inc(x *int) {
  *x++ // dereference the memory address
}
```