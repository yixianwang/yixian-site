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

TreeSet<Student> headSet = (TreeSet<Student>) people.headSet(new Student(21, "anything"));
TreeSet<Student> tailSet = (TreeSet<Student>) people.tailSet(new Student(21, "anything"));
TreeSet<Student> subSet = (TreeSet<Student>) people.subSet(new Student (3, "anything"), new Student (122, "anything"));
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

## PriorityQueue
```java
PriorityQueue<Integer> pq = new PriorityQueue<>(
    (n1, n2) -> map.get(n1) - map.get(n2)
);
pq.add(10);
int r = pq.size();
boolean r = pq.isEmpty();
int r = pq.peek();
int r = pq.poll();
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