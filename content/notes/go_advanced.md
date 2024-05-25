+++
title = 'Go Advanced'
date = 2024-05-24T00:20:16-04:00
+++

## Setting up

### file structure
- some_folder/module_name/package_name/go_file.go

### new project == new module
- name module with github repository is very common
```
go mod init github.com/yixianwang/module_name
```

### go run
- equals to `go build` and then run executable

## Data Types
```
const myConst
var myVar

bool
float32 float64
int int16 int32 int64
rune
string
unit uint8 uint16 uint32 uint64
```
> built-in package `import "unicode/utf8"` then use `utf8.RuneCountInString("汉")`

## Functions & Control Structures

### Function with multiple return values
```
func intDivision(numerator int, denominator int) (int, int) {
    var result int = numerator / denominator
    var remainder int = numerator % denominator
    return result, remainder
}
// var result, remainder = intDivision(numerator, denominator)
```

### error handling
```
import "errors"

func intDivision(numerator int, denominator int) (int, int, error) {
    var err error // default value is nil
    if denominator == 0 {
        err = errors.New("some message")
        return 0, 0, err
    }
    var result int = numerator / denominator
    var remainder int = numerator % denominator
    return result, remainder, err
}
// var result, remainder, err = intDivision(numerator, denominator)
// if err != nil {
//     fmt.Printf(err.Error())
// }
```

### switch keyword

```
// similar to if
switch {
    case err != nil:
        fmt.Printf(err.Error())
    case remainder == 0:
        fmt.Printf("%v", result)
    default:
        fmt.Printf("%v, %v", result, remainder)
}

// another syntax with switch
switch remainder {
    case 0:
        fmt.Printf("The division was exact")
    case 1, 2:
        fmt.Printf("The division was exact")
    default:
        fmt.Printf("The division was not close")
}
```

## Arrays, Slices, Maps && Looping Control Structures

```
var intArr [3]int32 = [3]int32{1,2,3}
// intArr := [3]int32{1,2,3}
// intArr := [...]int32{1,2,3}

var intSlice []int32 = []int32{4,5,6}
fmt.Printf("The length is %v with capacity %v", len(intSlice), cap(intSlice))
intSlice = append(intSlice, 7)
fmt.Printf("The length is %v with capacity %v", len(intSlice), cap(intSlice))

var intSlice2 []int32 = []int32{8, 9}
intSlice = append(intSlice, intSlice2...)

var intSlice3 []int32 = make(int32[], 3) // 3 is length
// var intSlice3 []int32 = make(int32[], 3, 8) // 8 is capacity (optional, default is equal to length of slice)


var myMap map[string]uint8 = make(map[string]uint8)
fmt.Println(myMap)

var myMap2 = map[string]uint8{"Adam":23, "Sam":45}
fmt.Println(myMap["Adam"])

fmt.Println(myMap["KeyNotExist"]) // get default value of uint8, which is 0

var age, ok = myMap2["Adam"] // ok is true if the key exist in the map, and false otherwise

delete(myMap2, "Adam") // no return value
```

```
// iterate over i.e. map, array, slice
for key, val := range myMap2 {
    fmt.Printf("key: %v, val: %v\n", key, val)
}

for idx, val := range intArr {
    fmt.Printf("idx: %v, val: %v\n", idx, val)
} 
```

## Strings, Runes, Bytes
- `%v`, value
- `%T`, type of the value

```
var myString = "résumé"
var indexed = myString[1] // return 195 != 233, it's not correct
fmt.Printf("%v, %T\n", indexed, indexed)
for i, v := range myString {
    fmt.Println(i, v)
}

// 114, uint8
// 0 114
// 1 233 // 233 is correct here with range keyword
// 3 115
// 4 117
// 5 109
// 6 233
```
- `len(myString)` return the number of bytes of `myString`

### runes
- runes are just Unicode Point numbers which represent the character
- runes are just an alias for **int32**
- we can declare a rune type using a single quote `var myRune = 'a'`
```
var myString = []rune("résumé")
var indexed = myString[1] // return 233 == 233, correct
fmt.Printf("%v, %T\n", indexed, indexed)
for i, v := range myString {
    fmt.Println(i, v)
}
```

### string building
- strings are immutable in go, we cannot modify them once created
```
var strSlice = []string{"y", "i", "x", "i", "a", "n"}
var catStr = ""
for i := range strSlice {
    catStr += strSlice[i]
}
fmt.Printf("\n%v", catStr)
```

- best practice: we can import built-in `strings` package, and create a `strings.Builder`
- instead of using plus operator, we call `WriteString` method
```
var strSlice = []string{"y", "i", "x", "i", "a", "n"}
var strBuilder strings.Builder
for i := range strSlice {
  strBuilder.WriteString(strSlice[i])
}
var catStr = strBuilder.String()
fmt.Printf("\n%v", catStr)
```

## Structs, Interfaces
```
package main

import "fmt"

// create a struct
type gasEngine struct {
    mpg uint8
    gallons uint8
    // ownerInfo owner
    owner // we can adding subfield directly
    int // use type int directly, so we can use this syntax with any type
}

type owner struct {
    name string
}

func main() {
    // var myEngine gasEngine
    // fmt.Println(myEngine.mpg, myEngine.gallons)
    // 0, 0

    // var myEngine gasEngine = gasEngine{mpg:25, gallons:15}
    // var myEngine gasEngine = gasEngine{25, 15} // we can omit the field names, it will assign in order
    // myEngine.mpt = 20 // we can also set the values by name directly
    // fmt.Println(myEngine.mpg, myEngine.gallons)
    // 25, 15

    var myEngine gasEngine = gasEngine{25, 15, owner{"Alex"}}
    fmt.Println(myEngine.mpg, myEngine.gallons, myEngine.ownerInfo.name) // if we adding subfield directly, we can omit ownerInfo field
}
```

### anonymous struct
- define and initialize in the same location
- the main difference is that is not reusable
```
package main

import "fmt"

type gasEngine struct {
    mpg uint8
    gallons uint8
}

func main() {
    // var myEngine gasEngine = gasEngine{25, 15}
    var myEngine2 = struct {
        mpg uint8
        gallons uint8
    } {21, 12}
    fmt.Println(myEngine2)
}
```

### struct method
```
package main

import "fmt"

type gasEngine struct {
    mpg uint8
    gallons uint8
}

func (e gasEngine) milesLeft() uint8 {
    return e.gallons * e.mpg
}

func main() {
    var myEngine gasEngine = gasEngine{25, 15}
    fmt.Println(myEngine2)
}
```

### interface
```
package main

import "fmt"

type gasEngine struct {
    mpg uint8
    gallons uint8
}

type electricEngine struct {
    mpkwh uint8
    kwh uint8
}

func (e gasEngine) milesLeft() uint8 {
    return e.gallons * e.mpg
}

func (e electricEngine) milesLeft() uint8 {
    return e.kwh * e.mpkwh
}

type engine interface {
    milesLeft() uint8 // 1. method signature
}

func canMakeIt(e engine, miles uint8) { // 2. use engine here
    if miles <= e.milesLeft() {
        fmt.Println("You can make it there!")
    } else {
        fmt.Println("Need to fuel up first!")
    }
}

func main() {
    var myEngine gasEngine = gasEngine{25, 15}
    canMakeIt(myEngine, 50) // 3. apply with various Engine types
}
```

## Pointers
```
var p *int32 = new(int32)
var i int32
```
36:49

## Goroutines

## Channels

## Generics

## Building an API!