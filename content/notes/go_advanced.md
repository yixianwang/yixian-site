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
- same to c/c++

## Goroutines
- use `go` keyword in front of the function we want to run concurrently
- import `sync` package, to let **wait groups** come in
- then we create a wait group `var wg = sync.WaitGroup{}`, they just like counters
- add `wg.Add(1)` and `wg.Done()`
- add `wg.Wait()`, it gonna wait for the counter to go back down to 0, meaning all the tasks have completed

```
package main

import (
    "fmt"
    "math/rand"
    "time"
    "sync"
)

var wg = sync.WaitGroup{}
var dbData = []string{"id1", "id2", "id3", "id4", "id5"}

func main() {
    t0 := time.Now()
    for i := 0; i < len(dbData); i++ {
        wg.Add(1)
        go dbCall(i)
    }
    wg.Wait()
    fmt.Printf("\nTotal execution time: %v", time.Since(t0))
}

func dbCall(i int) {
    // simulate DB call delay
    var delay float32 = rand.Float32() * 2000
    time.Sleep(time.Duration(delay) * time.Millisecond)
    fmt.Println("The result from the database is:", dbData[i])
    wg.Done()
}
```

### using locks to make threads safe

#### without lock
```
package main

import (
    "fmt"
    "time"
    "sync"
)

var wg = sync.WaitGroup{}
var dbData = []string{"id1", "id2", "id3", "id4", "id5"}
var results = []string{} // 1. create a slice to store all the result from db

func main() {
    t0 := time.Now()
    for i := 0; i < len(dbData); i++ {
        wg.Add(1)
        go dbCall(i)
    }
    wg.Wait()
    fmt.Printf("\nTotal execution time: %v", time.Since(t0))
    fmt.Printf("\nThe results are %v", results) // 3. print the results
}

func dbCall(i int) {
    // simulate DB call delay
    var delay float32 = 2000
    time.Sleep(time.Duration(delay) * time.Millisecond)
    fmt.Println("The result from the database is:", dbData[i])
    results = append(results, dbData[i]) // 2. append the result
    wg.Done()
}
```
> Above code, WE WILL GET AN UNEXPECTED RESULT 

#### with lock (sync.Mutex{})
- to make thread safe, we can use **mutex (Mutual Exclusion)** by `var m = sync.Mutex{}`
- with two main methods `m.Lock()` and `m.Unlock()`, and place them around the part of our code which access the result slice
- cons: it completely locks out other go routines to access the results slice

```
package main

import (
    "fmt"
    "time"
    "sync"
)

var m = sync.Mutex{} // 1. create a mutex
var wg = sync.WaitGroup{}
var dbData = []string{"id1", "id2", "id3", "id4", "id5"}
var results = []string{} 

func main() {
    t0 := time.Now()
    for i := 0; i < len(dbData); i++ {
        wg.Add(1)
        go dbCall(i)
    }
    wg.Wait()
    fmt.Printf("\nTotal execution time: %v", time.Since(t0))
    fmt.Printf("\nThe results are %v", results) 
}

func dbCall(i int) {
    // simulate DB call delay
    var delay float32 = 2000
    time.Sleep(time.Duration(delay) * time.Millisecond)
    fmt.Println("The result from the database is:", dbData[i])
    m.Lock() // 2. use lock
    results = append(results, dbData[i]) 
    m.Unlock() // 2. use unlock
    wg.Done()
}
```

#### with lock (sync.RWMutex{})
- this has all the same functionality of of the mutex above
  - and the `m.Lock()` and `m.Unlock()` work exactly the same
  - but we also have `m.RLock()` and `m.RUnlock()` methods

- workflows:
  1. when go routine reaches `m.RLock()`, it checks if there's a **full lock (`m.Lock()`)** on the mutex
    - if **full lock** exists, it(`m.RLock()`) will wait until **full lock** is released before continuing
    - if no full lock exists, the go routine will acquire a **read lock (`m.RLock()`)**, and then proceed with the rest of the code
- Note: 
  1. **many** go routines may hold **read locks** at the same time, these **read locks** will only block code execution up to the **full lock**
  2. when the a go routine hits **full lock** and in order to proceed, all **locks** must be cleared
> pros: **this prevents us from accessing the slice while other go routines are writing to or reading from the slice**

- summary: it allows multiple go routines to read from our slice at the same time, only blocking when writes may be potentially be happening

```
package main

import (
    "fmt"
    "time"
    "sync"
)

var m = sync.RWMutex{} // 1. use RWMutex
var wg = sync.WaitGroup{}
var dbData = []string{"id1", "id2", "id3", "id4", "id5"}
var results = []string{} 

func main() {
    t0 := time.Now()
    for i := 0; i < len(dbData); i++ {
        wg.Add(1)
        go dbCall(i)
    }
    wg.Wait()
    fmt.Printf("\nTotal execution time: %v", time.Since(t0))
    fmt.Printf("\nThe results are %v", results) 
}

func dbCall(i int) {
    var delay float32 = 2000
    time.Sleep(time.Duration(delay) * time.Millisecond)

    save(dbData[i])
    log()

    wg.Done()
}

func save(result string) {
    m.Lock()
    results = append(results, result)
    m.Unlock()
}

func log() {
    m.RLock()
    fmt.Printf("\nThe current results are: %v", results)
    m.RUnlock()
}
```

## Channels
- think of channels as a way to enable go routines to pass around information
- main features:
  1. Hold Data: i.e. integer, slice, or anything else
  2. Thread Safe: i.e. we avoid data races when we're reading and writing from memory
  3. Listen for Data: we can listen when data is added or removed from a channel and we can block code execution until one of these events happens.

- to make a channel, we use `make` function followed by the `chan` keyword, then the type of value we want the channel to hold. i.e. `var c = make(chan int)`, so this channel can only hold a single int value
- channels also have a special syntax. i.e. we use `<-` to add value to the channel
- we can think of a channel as containing an underlying array, in this case we have what's called an **Unbuffer Channel**, which only has enough room for one value.
- we can retrieve the value from a channel using `var i = <- c`, so here the value gets *popped out* of the channel(the channel is now empty) and variable `i` holds the value

### deadlock errors
- Why?:
  - when we write to an **Unbuffer Channel**(`c <- 1`), the code will block until something else reads from it.
  - so in effect we'll be waiting here forever, unable to reach the line (`var i = <- c`), where we actually read from the channel
  - luckily go's runtime is smart enough to notice this and we will just throw a deadlock error rather than our code hanging here forever.

> To use it properly in conjunction with go routine

- **Channel + Go Routines == Proper Way**

```
package main

import "fmt"

func main() {
    var c = make(chan int) // to make a channel
    c <- 1 // add value to the channel
    var i = <- c // retrieve the value from a channel
    fmt.Println(i)
}
```

### (Channel + Go Routines) is the proper way

#### example 1
```
package main

import "fmt"

func main() {
    var c = make(chan int) // 1. make a channel
    go process(c) // 2. call go routine
    fmt.Println(<- c) // !!! 3. the execution will be waiting here for a value to be set in the channel
    // !!! 5. then our main function notices that a value has been set, and finally the print function gets called
}

func process(c chan int) {
    c <- 123 // !!! 4. in this go routine, we set the value and exit the function
}
```

#### example 2
- we can iterate over the channel by using `range` keyword

- work flows:
  1. we create the channel(`make(chan int)`) and start the go routine(`go process(c)`)
  2. in the main function we wait at the top of the `for` loop for something to be added to the channel
  3. in the process function we setup `for` loop and add `0` to the channel
  4. we wait (`c <- 0`) until the main function reads from the channel
  5. and then in a concurrent way both the value printed and `1` is added to the channel at about the same time
  6. this then continues until `i` is equal to `5`.

```
package main

import "fmt"

func main() {
    var c = make(chan int)
    go process(c)
    for i := range c {
      fmt.Println(i) // i here is the value of the channel
    }
}

func process(c chan int) {
    for i := 0; i < 5; i++ {
        c <- i
    }
}
```
> Note: deadlock error happens again for above code
- because after we print all of our values from `0` to `4`, 
- the main function will go back to wait at the top of the `for` loop for another value
- but just like me on under after five messages it will get ghosted by the process function which won't send any more messages and we get deadlock error

- Solution:
  - before exiting a process, we can close the channel like `close(c)` or `defer close(c)`
  - `close(c)` notifies any other process using this channel that we're done
  - and our main function will break out of the `for` loop and exit.
> `defer close(c)` using `defer` statement and it go this just means do this stuff(`close(c)`) **right before the function exits**.

```
package main

import "fmt"

func main() {
    var c = make(chan int)
    go process(c)
    for i := range c {
      fmt.Println(i)
    }
}

func process(c chan int) {
    for i := 0; i < 5; i++ {
        c <- i
    }
    close(c) // close the channel
}
```

## Buffer Channel
- now we can store multiple values in the channel at the same time.
- i.e. we can store 5 integers `var c = make(chan int, 5)`

> if we run the code with the regular channel, the process function stays active until the main function is done with the channel. But there's no need for the process function to hang around. It can finish its work quickly and just exit. And let the main function do its thing.

```
package main

import (
    "fmt"
    "time"
)

func main() {
    var c = make(chan int, 5) // the process function can add up to 5 values in the channel without having to wait for the main function to make room in the channel by popping out a value(at the for loop line)
    go process(c)
    for i := range c {
      fmt.Println(i)
      time.Sleep(time.Second * 1) // some work..., takes 1 second
    }
}

func process(c chan int) {
    defer close(c)
    for i := 0; i < 5; i++ {
        c <- i
    }
    fmt.Println("Exiting process")
}
```
> Note: the process function finishes almost immediately while the main function is still running reading the values in the channel.

## Realistic example of Channels
```
package main

import (
    "fmt"
    "math/rand"
    "time"
)

var MAX_CHICKEN_PRICE float32 = 5
var MAX_TOFU_PRICE float32 = 3

// there are three go routines running at the same time checking these three websites
// and sendMessage function is waiting there for value to be added to the channel to send off text
// so the first go routine to find a deal on chicken will trigger the text message in the program and exit.
func main() {
    var chickenChannel = make(chan string) // the channel holds the website we found the sale on
    var tofuChannel = make(chan string) // when we find a bargain on tofu we write to this channel
    var websites = []string{"walmart.com", "costco.com", "wholefoods.com"}
    for i := range websites {
        go checkChickenPrices(websites[i], chickenChannel) // we spawn three go routines
        go checkTofuPrices(websites[i], tofuChannel)
    }
    sendMessage(chickenChannel, tofuChannel) // send a message when a deal is found
}

func checkTofuPrices(website string, c chan string) {
    for {
        time.Sleep(time.Second * 1)
        var tofu_price = rand.Float32() * 20
        if tofu_price <= MAX_TOFU_PRICE {
            c <- website
            break
        }
    }
}

func checkChickenPrices(website string, chickenChannel chan string) {
    for { 
        // every second check the website for the price of chicken 
        // and if it's below our threshold, it will set the value of the channel to the website
        time.Sleep(time.Second * 1)
        var chickenPrice = rand.Float32() * 20
        if chickenPrice <= MAX_CHICKEN_PRICE {
            chickenChannel <- website
            break
        }
    }
}

func sendMessage(chickenChannel chan string, tofuChannel chan string) {
    // fmt.Printf("\nFound a deal on chicken at %s", <- chickenChannel) // waiting here for value to be added to the channel
    
    // select statement will listen for a result once it gets one it'll execute one of those statements and exit.
    select { 
        // if we receive a message from the chicken channel, we set the variable website to the value in the channel and we execute the following statement
        case website := <- chickenChannel:
            fmt.Printf("\nText sent: Found deal on chicken at %v.", website)
        // otherwise if we receive a message from the tofu channel, we execute the following statement
        case website := <- tofuChannel:
            fmt.Printf("\nEmail sent: Found deal on chicken at %v.", website)
    }
}
```

## Generics

### normal generic example
```
package main
import "fmt"

func main() {
    var intSlice = []int{1, 2, 3}
    fmt.Println(sumSlice[int](intSlice))

    var float32Slice = []float32{1, 2, 3}
    fmt.Println(sumSlice[float32](float32Slice))
}

func sumSlice[T int | float32 | float64](slice []T) T {
    var sum T
    for _, v := range slice {
        sum += v
    }
    return sum
}
```
### any type example
```
package main
import "fmt"

func main() {
    var intSlice = []int{}
    fmt.Println(isEmpty(intSlice)) // we can omit the square bracket type input here

    var float32Slice = []float32{1, 2, 3}
    fmt.Println(isEmpty(float32Slice)) // and here
}

func isEmpty[T any](slice []T) bool {
    return len(slice) == 0
}
```

### an example that we can't infer the type of our generic parameter
```
package main

import (
    "fmt"
    "encoding/json"
    "io/ioutil"
)

type contactInfo struct {
    Name string
    Email string
}

type purchaseInfo struct {
    Name string
    Price float32
    Amount int
}

func main() {
    var contacts []contactInfo = loadJSON[contactInfo]("./contactInfo.json")
    fmt.Printf("\n%+v", contacts)

    var purchases []purchaseInfo = loadJSON[purchaseInfo]("./purchaseInfo.json")
    fmt.Printf("\n%+v", purchases)
}

func loadJSON[T contactInfo | purchaseInfo] (filePath string) []T {
    data, _ = ioutil.ReadFile(filePath)

    var loaded = []T{}
    json.Unmarshal(data, &loaded)

    return loaded
}
```

### struct generic
```
package main

import "fmt"

type gasEngine struct {
  gallons float32
  mpg float32
}

type electricEngine struct {
  kwh float32
  mpkwh float32
}

type car[T gasEngine | electricEngine] struct {
    carMake string
    carModel string
    engine T
}

func main() {
    var gasCar = car[gasEngine] {
        carMake: "Honda",
        carModel: "Civic",
        engine: gasEngine {
            gallons: 12.4,
            mpg: 40,
        },
    }
    fmt.Println(gasCar)
    var electricCar = car[electricEngine] {
        carMake: "Tesla",
        carModel: "Model 3",
        engine: electricEngine {
            kwh: 57.5,
            mpkwh: 4.17,
        },
    }
    fmt.Println(electricCar)
}
```

## Building an API!
- [youtube](https://www.youtube.com/watch?v=8uiZC0l4Ajw)
- [Code](https://github.com/avukadin/goapi)

- [Reference: Golang Project Layout](https://github.com/golang-standards/project-layout)

1. `go mod init module_name(i.e. Github URL)`
2. `mkdir api`, api folder contains specs things like parameters and response type for our endpoint. This is also where we could put our yaml spec file.
3. `mkdir cmd/api`, will contain our **main.go**.
4. `mkdir internal`, will contain most of code for this API.

