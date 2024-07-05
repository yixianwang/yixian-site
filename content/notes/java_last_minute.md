+++
title = 'Java Last Minute'
date = 2024-04-11T23:30:02-04:00
+++

## 1D Array
```java
int[] r = new int[26];
// r.length;

String[] r = {"c1", "c2", "c3"};
Arrays.fill(r, 0);
```

## 2D Array
```java
String[][] r = new String[3][3];

String[][] r = {{"a", "b"}, {"c", "d"}};
for (String[] row : r) {
    Arrays.fill(row, "apple"); // Fill each row with the string "apple"
}
```

## Character
```java
Character.isLetterOrDigit(s.charAt(i)) // isWhitespace, isLetter, isDigit
Character.toLowerCase(s.charAt(i)) != Character.toLowerCase(s.charAt(j))
```

## String
```java
String name = "Bro";
// name.length();

char[] ch = str.toCharArray();
return new String(ch) // convert char array back to String

substring(int beginIndex, int endIndex)

String r = name.trim();
String r = name.replace('o', 'a');  // return Bra

boolean r = name.equals("Bro");
boolean r = name.equalsIgnoreCase("bro");
int r = str1.compareTo(str2) // lexicographically, > 0, < 0, == 0

char r = name.charAt(0);
int r = name.indexOf("B");
boolean r = name.isEmpty();
String r = name.toUpperCase(); // toLowerCase

List<String> wordList = Arrays.asList(s.split("\\s+")); // split by multiple spaces
Collections.reverse(wordList);
String r = String.join(" ", wordList); // return a String
```

## StringBuilder
```java
StringBuilder sb = new StringBuilder();
sb.append(str); // append the string to string builder
sb.insert(offset, str, start, end);
sb.deleteCharAt(0);
sb.setCharAt(0, 'z');
sb.toString(); // convert string builder to string
```

## ArrayList
```java
ArrayList<String> r = new ArrayList<>();
// r.size();

r.add("add at the end");
r.add("add at idx 1", 1);
r.remove(2); // remove at index 2
r.clear();
r.set(0, "replace at index 0");
r.get(0);

// array -> list
List<Boolean> result = Arrays.asList(new Boolean[candies.length]); // fix-sized list
return Arrays.asList(array); // from Array to List

// list -> array
String[] array = new String[0];
array = list.toArray(array);
```

## 2D ArrayList
```java
ArrayList<ArrayList<String>> r = new ArrayList();
```

## Deque
```java
// better performance. internal data structure is array, doesn't support null 
Deque<Integer> arrayDeque = new ArrayDeque<>();
// better flexibility. internal data structure is double linked list, support null 
Deque<Integer> linkedList = new LinkedList<>();

// peekFirst() peekLast()
int pf = arrayDeque.peekFirst();
int pl = arrayDeque.peekLast();

// offerFirst() offerLast()
arrayDeque.offerFirst(20);
arrayDeque.offerLast(10);

// removeFirst() removeLast()
int dequeuedFromArrayDeque1 = arrayDeque.removeFirst();
int dequeuedFromArrayDeque2 = arrayDeque.removeLast();
```

## HashSet
```Java
HashSet<String> hs = new HashSet<>();
// hs.size();

hs.add("Apple");
hs.remove("Apple");
hs.clear();
boolean containsApple = hs.contains("Apple");

Set<String> synchronizedSet = Collections.synchronizedSet(new HashSet<>());
```

## HashMap
```java
HashMap<String, String> hm = new HashMap<>();
// hm.size();

hm.put("USA", "DC"); // if key doesn't exist: add, otherwise update value
hm.putIfAbsent("USA", "Austin"); // if key exist, do nothing, otherwise add

hm.remove("USA");
hm.clear();

hm.replace("USA", "Miami"); // if key doesn't exist, do nothing

hm.getOrDefault("USA", "Dallas");
hm.get("USA");

hm.containsKey("USA");
hm.containsValue("DC");

for (String key : hm.keySet()) {
  String val = hm.get(key);
  ...
}

if (!ans.containsKey(key)) ans.put(key, new ArrayList());

return new ArrayList(ans.values()); // Map<String, List> -> List<List<String>>

return new ArrayList(); // for return empty (List<List<AnyType>>)

Map<Integer, String> synchronizedHashMap = Collections.synchronizedMap(new HashMap<>());
```

## TreeSet
```java
TreeSet<Student> ts = new TreeSet<>(
    (l, r) -> (l.age - r.age)
);

Comparator<Student> ageComparator = new Comparator<Student>() {
   @Override
   public int compare(Student s1, Student s2) {
       return Integer.compare(s1.getAge(), s2.getAge());
   }
};
TreeSet<Student> student = new TreeSet<>(ageComparator);

ts.add(new Student(1, "a")); // idempotent: if exist, do nothing
ts.remove(new Student(1, "a")); // idempotent
// to update: remove the old one, add the updated one
ts.contains(new Student(1, "a"); // safe

Student first = ts.first();
Student last = ts.last();
Student lower = ts.lower(new Student(3, "anything"));
Student higher = ts.higher(new Student(3, "anything"));
Student floor = ts.floor(new Student(3, "anything"));
Student ceiling = ts.ceiling(new Student(3, "anything));

TreeSet<Student> headSet = (TreeSet<Student>) people.headSet(new Student(21, "anything"));
TreeSet<Student> tailSet = (TreeSet<Student>) people.tailSet(new Student(21, "anything"));
TreeSet<Student> subSet = (TreeSet<Student>) people.subSet(new Student (3, "anything"), new Student (122, "anything"));

SortedSet<String> synchronizedTreeSet = Collections.synchronizedSortedSet(new TreeSet<>());
```

### update element within TreeSet
```Java
public static void updatePersonAge(TreeSet<Person> people, String name, int newAge) {
  // Find the person with the given name
  Person personToUpdate = null;
  for (Person person : people) {
      if (person.getName().equals(name)) {
          personToUpdate = person;
          break;
      }
  }
  
  // If person is found, remove, update and reinsert
  if (personToUpdate != null) {
      people.remove(personToUpdate); // Remove the old person
      personToUpdate.setAge(newAge); // Update the age
      people.add(personToUpdate); // Add the updated person
  }
}
```

## TreeMap
```Java
TreeMap<Integer, String> tm = new TreeMap<>();
// tm.size();

tm.put(3, "Three");
tm.remove(2);
tm.clear();
String v = tm.get(3);
boolean containsKey = tm.containsKey(1);
boolean containsValue = tm.containsValue("Four");

Integer firstKey = tm.firstKey();
Integer lastKey = tm.lastKey();

Integer lowerKey = treeMap.lowerKey(3); // Returns 2
Integer floorKey = treeMap.floorKey(3); // Returns 3
Integer higherKey = treeMap.higherKey(3); // Returns 4
Integer ceilingKey = treeMap.ceilingKey(3); // Returns 3

SortedMap<Integer, String> headMap = treeMap.headMap(3); // Elements < 3
SortedMap<Integer, String> tailMap = treeMap.tailMap(3); // Elements >= 3
SortedMap<Integer, String> subMap = treeMap.subMap(2, 4); // Elements >= 2 and < 4

SortedMap<Integer, String> synchronizedTreeMap = Collections.synchronizedSortedMap(new TreeMap<>());
```

## HashTable

## ConcurrentHashMap
```Java
ConcurrentHashMap<Integer, String> map = new ConcurrentHashMap<>();
// map.size();

// basic operations
map.put(1, "One");
map.remove(2);
map.clear();
String value = map.get(1);
boolean containsKey = map.containsKey(3);
boolean containsValue = map.containsValue("Three");

// concurrent operations
map.putIfAbsent(4, "Four"); // Adds the value only if the key is not already present
map.remove(1, "One"); // Removes the entry only if the key is mapped to the specified value
map.replace(3, "Three", "ThreeReplaced"); // Replaces the value only if the key is mapped to the specified value
map.compute(3, (key, value) -> value + "Updated"); // Computes a new mapping for the specified key using the given remapping function
map.computeIfAbsent(5, key -> "Five"); // Computes a new value for the specified key if it is not already present
map.computeIfPresent(3, (key, value) -> value + "UpdatedAgain"); // Computes a new value for the specified key if it is already present
```

### Iterating over ConcurrentHashMap
```Java
for (Integer key : map.keySet()) {
    System.out.println("Key: " + key + ", Value: " + map.get(key));
}

for (Map.Entry<Integer, String> entry : map.entrySet()) {
    System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
}

for (String value : map.values()) {
    System.out.println("Value: " + value);
}
```

## PriorityQueue
```java
PriorityQueue<Integer> pq = new PriorityQueue<>(
    (n1, n2) -> map.get(n1) - map.get(n2)
);
// pq.size();

pq.add(10);
int r = pq.poll();

int r = pq.peek();
boolean r = pq.isEmpty();
```

### PriorityQueue + HashMap
```java
// leetcode 347
class Solution {
    public int[] topKFrequent(int[] nums, int k) {
        // 使用字典，统计每个元素出现的次数，元素为键，元素出现的次数为值
        Map<Integer, Integer> map = new HashMap();
        for(int num : nums){
            if (map.containsKey(num)) {
                map.put(num, map.get(num) + 1);
            } else {
                map.put(num, 1);
            }
        }

        // 遍历map，用最小堆保存频率最大的k个元素
        // PriorityQueue<Integer> pq = new PriorityQueue<>(new Comparator<Integer>() {
        //     @Override
        //     public int compare(Integer a, Integer b) {
        //         return map.get(a) - map.get(b);
        //     }
        // });
        PriorityQueue<Integer> pq = new PriorityQueue<>(
            (n1, n2) -> map.get(n1) - map.get(n2)
        );

        for (Integer key : map.keySet()) {
            pq.add(key);
            if (pq.size() > k) {
                pq.poll();
            }
        }

        // 取出最小堆中的元素
        List<Integer> res = new ArrayList<>();
        while (!pq.isEmpty()) {
            res.add(pq.poll());
        }

        // List 变成 Array
        int[] arrayResult = new int[res.size()];
        for (int i = 0; i < res.size(); ++i) {
            arrayResult[i] = res.get(i);
        }
        return arrayResult;
    }
}
```

### Queue + Pair
```java
// leetcode 988
class Solution {
    public String smallestFromLeaf(TreeNode root) {
        String smallestString = "";
        Queue<Pair<TreeNode, String>> nodeQueue = new LinkedList<>();

        // Add root node to queue along with its value converted to a character
        nodeQueue.add(new Pair<>(root, String.valueOf((char)(root.val + 'a'))));

        // Perform BFS traversal until queue is empty
        while (!nodeQueue.isEmpty()) {

            // Pop the leftmost node and its corresponding string from queue
            Pair<TreeNode, String> pair = nodeQueue.poll();
            TreeNode node = pair.getKey();
            String currentString = pair.getValue();
    
            // If current node is a leaf node
            if (node.left == null && node.right == null) {
            
                // Update smallest_string if it's empty or current string is smaller
                if (smallestString.isEmpty()) {
                    smallestString = currentString;
                } else {
                    smallestString = currentString.compareTo(smallestString) < 0 ? currentString : smallestString;
                }
            }

            // If current node has a left child, append it to queue
            if (node.left != null) {
                nodeQueue.add(new Pair<>(node.left, (char)(node.left.val + 'a') + currentString));
            }

            // If current node has a right child, append it to queue
            if (node.right != null) {
                nodeQueue.add(new Pair<>(node.right, (char)(node.right.val + 'a') + currentString));
            }
        }

        return smallestString;
    }
}
```

## Collections
### sort
```java
// List
Collections.sort(v, (l, r) -> l.name.compareTo(r.name));

// Array
Arrays.sort(v, (l, r) -> l.name.compareTo(r.name));
```

### min
```java
// List
Student my_min = Collections.min(vl, (l, r) -> l.age - r.age);
```

## stream
```java
// people is ArrayList
List<Person> hundredSorted = people.stream()
        .filter(person -> person.billions >= 100)
        .sorted(Comparator.comparing(person -> person.name))
        .collect(Collectors.toList());
hundredSorted.forEach(person -> System.out.println(person.name));
```

## Functional Interface
- Predicate<T>: Represents a predicate (boolean-valued function) of one argument.
   - Method: boolean test(T t)

- Consumer<T>: Represents an operation that accepts a single input argument and returns no result.
   - Method: void accept(T t)

- Function<T, R>: Represents a function that accepts one argument and produces a result.
   - Method: R apply(T t)

- Supplier<T>: Represents a supplier of results.
   - Method: T get()

- UnaryOperator<T>: Represents an operation on a single operand that produces a result of the same type as its operand.
   - Method: T apply(T t)

- BinaryOperator<T>: Represents an operation upon two operands of the same type, producing a result of the same type as the operands.
   - Method: T apply(T t1, T t2)

```Java
Predicate<Integer> isEven = num -> num % 2 == 0;
System.out.println(isEven.test(4)); // Outputs: true
System.out.println(isEven.test(3)); // Outputs: false

Function<String, Integer> stringLength = String::length;
System.out.println(stringLength.apply("Hello")); // Outputs: 5

Supplier<Double> randomValue = Math::random;
System.out.println(randomValue.get()); // Outputs a random value between 0.0 and 1.0

Consumer<String> print = System.out::println;
print.accept("Hello, world!"); // Outputs: Hello, world!

UnaryOperator<Integer> square = x -> x * x;
System.out.println(square.apply(5)); // Outputs: 25
```

### Combining Functional Interfaces
- Functional interfaces can be combined to create more complex behaviors using default methods like `andThen` and `compose`.
```Java
Consumer<String> greet = name -> System.out.println("Hello, " + name);
Consumer<String> askHowAreYou = name -> System.out.println("How are you, " + name + "?");

Consumer<String> greetAndAsk = greet.andThen(askHowAreYou);
greetAndAsk.accept("John");
// Outputs:
// Hello, John
// How are you, John?
```

## Method Reference
```Java
List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);
// Using a method reference to a static method
numbers.forEach(MethodReferenceExample::printNumber);

List<String> messages = Arrays.asList("Hello", "World", "Java");
MethodReferenceExample example = new MethodReferenceExample();
// Using a method reference to an instance method of a particular object
messages.forEach(example::printMessage);

List<String> messages = Arrays.asList("Hello", "World", "Java");
// Using a method reference to an instance method of an arbitrary object
messages.forEach(String::toUpperCase);

// Using a method reference to a constructor
Supplier<ArrayList<String>> listSupplier = ArrayList::new;
ArrayList<String> list = listSupplier.get();
```

## Optional Class
### Creating Optional Instance
1. Empty Optional: Represents a missing or absent value.
    ```Java
    Represents a missing or absent value.
    ```
2. Non-empty Optional: Wraps a non-null value.
    ```Java
    Optional<String> nonEmpty = Optional.of("Hello");
    ```
3. Nullable Optional: Can wrap a value that might be null, returning an empty Optional if the value is null.
    ```Java
    Optional<String> nullable = Optional.ofNullable(null);
    ```
### Basic Operations
```Java
boolean present = nonEmpty.isPresent(); // true
boolean absent = empty.isPresent(); // false

nonEmpty.ifPresent(value -> System.out.println("Value: " + value)); // Outputs: Value: Hello

String value = nonEmpty.get(); // "Hello"
// empty.get(); // Throws NoSuchElementException

String value = empty.orElse("Default"); // "Default"

String value = empty.orElseGet(() -> "Default from Supplier"); // "Default from Supplier"

// empty.orElseThrow(() -> new IllegalArgumentException("No value present")); // Throws IllegalArgumentException
```

### Transforming Optional Values
```Java
// map(): Applies a function to the value if present and returns an `Optional` containing the result.
Optional<Integer> length = nonEmpty.map(String::length); // Optional[5]

// flatmap(): Similar to `map`, but the function must return an `Optional`. It is used to avoid nested optionals.
Optional<String> nonEmptyUpper = nonEmpty.flatMap(val -> Optional.of(val.toUpperCase())); // Optional[HELLO]

// filter(): Applies a predicate to the value if present and returns an Optional containing the value if it matches the predicate.
Optional<String> filtered = nonEmpty.filter(val -> val.length() > 3); // Optional[Hello]
Optional<String> filteredEmpty = nonEmpty.filter(val -> val.length() > 5); // Optional.empty
```

### Example
```Java
public class Person {
    private Optional<Address> address;

    public Optional<Address> getAddress() {
        return address;
    }
}

public class Address {
    private String city;

    public String getCity() {
        return city;
    }
}

public class Main {
    public static void main(String[] args) {
        Person person = new Person();
        String city = person.getAddress()
                            .flatMap(Address::getCity)
                            .orElse("Unknown city");

        System.out.println("City: " + city); // Outputs: City: Unknown city
    }
}
```

### Combining Options
1. Chaining Options: Using methods like flatMap, you can chain multiple optionals.
    ```Java
    Optional<Person> person = Optional.of(new Person());
    String city = person.flatMap(Person::getAddress)
                        .map(Address::getCity)
                        .orElse("Unknown city");
    ```
2. Merging Options: Combining the values of multiple optionals if they are present.
    ```Java
    Optional<String> opt1 = Optional.of("Hello");
    Optional<String> opt2 = Optional.of("World");

    Optional<String> combined = opt1.flatMap(val1 -> opt2.map(val2 -> val1 + " " + val2));
    combined.ifPresent(System.out::println); // Outputs: Hello World
    ```

### Best Practices
1. Use `Optional` for Return Types:
   - Use `Optional` as the return type of methods to indicate that the method might not return a value.
2. Avoid Optional in Fields and Parameters:
   - Avoid using `Optional` for fields or method parameters, as it can introduce unnecessary complexity.
3. Prefer `orElseGet` over `orElse`:
   - Use `orElseGet` instead of `orElse` when the default value computation is expensive or has side effects.
4. Do Not Use `Optional` for Collection Elements:
   - Avoid using `Optional` for elements of collections, as it can lead to a convoluted design. Instead, use an empty collection to represent the absence of elements.

## compareTo
1. add `implements Comparable<Student>` in class
2. override method
   ```java
   @Override
   public int compareTo(Student other) {
       return this.age.compareTo(other.age);
   }
   ```

## Comparator
```java
Comparator<Student> ageComparator = new Comparator<Student>() {
   @Override
   public int compare(Student p1, Student p2) {
       return Integer.compare(p1.getAge(), p2.getAge());
   }
};
TreeSet<Student> people = new TreeSet<>(ageComparator);
```

## Multithreading
### Thread
### Runnable
### Callable
### CompletableFuture
### Thread Pool
### Virtual Thread

## Lock
## CAS

## Design Pattern
### Singleton
### Simple Factory
### Builder
### Proxy
### Adaptors
### Observers