+++
title = 'Java'
date = 2023-10-24T03:10:46-04:00
+++

## Java Version
- To check all java version: `/usr/libexec/java_home -V`
- and then select specific version of java within `.zshrc`

- for spark and hadoop: 1.8.0_391
`export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_391)`
- for sprint boot: 21.0.1
`export JAVA_HOME=$(/usr/libexec/java_home -v 21.0.1)`
`export PATH=$PATH:$JAVA_HOME`


## Interface
Java接口(Interface)是一系列方法的声明，是一些方法特征的集合，一个接口只有方法的特征没有方法的实现，因此这些方法可以在不同的地方被不同的类实现，而这些实现可以具有不同的行为。打一个比方，接口好比一个戏中的角色，这个角色有一些特定的属性和操作，然后实现接口的类就好比扮演这个角色的人，一个角色可以由不同的人来扮演，而不同的演员之间除了扮演一个共同的角色之外，并不要求其它的共同之处。

### 常用的Interface:

#### Set
Set注重独一无二,该体系集合可以知道某物是否已经存在于集合中,不会存储重复的元素。Set的实现类在面试中常用的是：HashSet 与 TreeSet

##### HashSet
- 无重复数据
- 可以有空数据
- 数据无序

```java
Set<String> set = new HashSet<>();
for (int i = 1; i < 6; i ++) {
    set.add(i + "");
}
set.add("1"); //不会重复写入数据
set.add(null);//可以写入空数据
Iterator<String> iter = set.iterator();
while (iter.hasNext()) {
    system.out.print(iter.next() + " ");//数据无序 
}// 输出(无序)为 3 4 1 5 null 2
```

##### TreeSet: (key balanced binary search tree)
- 无重复数据
- 不能有空数据
- 数据有序

```java
Set<String> set = new TreeSet<>();
for (int i = 1; i < 6; i ++) {
    set.add(i + "");
}
set.add("1"); //不会重复写入数据
//set.add(null);//不可以写入空数据
Iterator<String> iter = set.iterator();
while (iter.hasNext()) {
    system.out.print(iter.next() + " ");//数据有序
}// 输出(有序)为 1 2 3 4 5
```


#### Map
Map用于存储具有映射关系的数据。Map中存了两组数据(key与value),它们都可以是任何引用类型的数据，key不能重复，我们可以通过key取到对应的value。Map的实现类在面试中常用是：HashMap 和 TreeMap.

##### HashMap
- key 无重复，value 允许重复
- 允许 key 和 value 为空
- 数据无序
```java
public class Solution {
    public static void main(String[] args){
        Map<String, String> map = new HashMap<>();
        for (int i = 5; i > 0; i --) {
            map.put(i + "", i + "");
        }
        map.put("1","1");//key无重复
        map.put("11","1");//value可以重复
        map.put(null, null);//可以为空
        for (Iterator i = map.keySet().iterator(); i.hasNext(); ) {
            String key = (String)i.next();
            String value = map.get(key);
            System.out.println("key = " + key + ", value = " + value);
        }
    }
}
//输出
/*
key = 11, value = 1
key = null, value = null
key = 1, value = 1
key = 2, value = 2
key = 3, value = 3
key = 4, value = 4
key = 5, value = 5
*/
//输出顺序与输入顺序无关
```

##### TreeMap: (key balanced binary search tree)
- key 无重复，value 允许重复
- 不允许有null
- 有序(存入元素的时候对元素进行自动排序，迭代输出的时候就按排序顺序输出)
```java
public class Solution {
    public static void main(String[] args){
        Map<String, String> map = new TreeMap<>();
        for (int i = 5; i > 0; i --) {
            map.put(i + "", i + "");
        }
        map.put("1","1");//key无重复
        map.put("11","1");//value可以重复
        //map.put(null, null);//不可以为空
        for (Iterator i = map.keySet().iterator(); i.hasNext(); ) {
            String key = (String)i.next();
            String value = map.get(key);
            System.out.println("key = " + key + ", value = " + value);
        }
    }
}
//输出
/*
key = 1, value = 1
key = 11, value = 1
key = 2, value = 2
key = 3, value = 3
key = 4, value = 4
key = 5, value = 5
*/
//输出顺序位String排序后的顺序
```

#### List
一个 List 是一个元素有序的、可以重复(这一点与Set和Map不同)、可以为 null 的集合，List的实现类在面试中常用是：LinkedList 和 ArrayList
- LinkedList
    - 基于链表实现
- ArrayList
    - 基于动态数组实现
- LinkedList 与 ArrayList 对比：
    - 对于随机访问get和set，ArrayList绝对优于LinkedList，因为LinkedList要移动指针
    - 对于新增和删除操作add和remove，在已经得到了需要新增和删除的元素位置的前提下，LinkedList可以在O(1)的时间内删除和增加元素，而ArrayList需要移动增加或删除元素之后的所有元素的位置，时间复杂度是O(n)的，因此LinkedList优势较大

#### Queue
队列是一种比较重要的数据结构，它支持FIFO(First in First out)，即尾部添加、头部删除（先进队列的元素先出队列），跟我们生活中的排队类似。
- PriorityQueue
    - 基于堆(heap)实现
    - 非FIFO(最先出队列的是优先级最高的元素)
- 普通 Queue
    - 基于链表实现
    - FIFO

```java
Queue<Integer> queue = new LinkedList<>();
```

#### Stack
官方建议如果有使用栈的需求的时候，可以用Deque接口下的ArrayDeque作替代，因为ArrayDeque能提供更多的功能。

## Last Minute Java Syntax
- [References](https://github.com/withPrasheel/lastMinuteJavaSyntax/tree/master)

## Instantiate
```java
List <T> al = new ArrayList<> ();
List <T> ll = new LinkedList<> ();
List <T> v = new Vector<> ();

Set<T> hs = new HashSet<> ();
Set<T> lhs = new LinkedHashSet<> ();
Set<T> ts = new TreeSet<> ();

SortedSet<T> ts = new TreeSet<> ();

Queue <T> pq = new PriorityQueue<> ();
Queue <T> ad = new ArrayDeque<> ();

Deque<T> ad = new ArrayDeque<> ();
```

## Deque Methods
```java
public interface Deque<E> extends Queue<E> {
  void addFirst(E e); void addLast(E e);
  boolean offerFirst(E e); boolean offerLast(E e);

  E removeFirst(); E removeLast();
  E pollFirst(); E pollLast();

  E getFirst(); E getLast();
  E peekFirst(); E peekLast();
}

// ArrayDeque doesn't support null element
ArrayDeque<T> queue = new ArrayDeque() {{ offer(root); }};
ArrayDeque<T> queue = new ArrayDeque();        
Queue<T> queue = new ArrayDeque();        
while (!queue.isEmpty()) {
  curr = queue.poll();
  queue.offer(curr.left);
}

// LinkedList supports null element
Queue<T> queue = new LinkedList(){{ offer(root); offer(null); }};
while (!queue.isEmpty()) {
  curr = queue.poll();
  queue.offer(curr.left); 
  queue.offer(null);
}
```

