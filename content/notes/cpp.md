+++
title = 'Cpp'
date = 2023-10-24T03:10:46-04:00
+++

## assert
```c++
#include<cassert>

assert((expression) && "msg")
assert(expression); // cannot be std::assert(expression)
```

## try throw catch - error handling
```c++
  try {
    // do something that might throw an error
    throw std::invalid_argument("MyFunc argument too large.");
  } catch (const std::exception& e) {
    // handle the error
    std::cout << "3333" << n << std::endl;
    std::cerr << e.what() << std::endl;
//     return -1;
  }
```

## gtest with cmake
- [gtest helloworld](https://google.github.io/googletest/quickstart-cmake.html)

### step 1:
```bash
mkdir my_project && cd my_project
```

### step 2: CMakeLists.txt
```
# within CMakeLists.txt
cmake_minimum_required(VERSION 3.14)
project(my_project)

# GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)
# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)
```

### step 3: test fucntions
```c++
#include <gtest/gtest.h>

// Demonstrate some basic assertions.
TEST(HelloTest, BasicAssertions) {
  // Expect two strings not to be equal.
  EXPECT_STRNE("hello", "world");
  // Expect equality.
  EXPECT_EQ(7 * 6, 42);
}
```

### step 4: Append to CMakeLists.txt
```
enable_testing()

add_executable(
  hello_test
  hello_test.cc
)
target_link_libraries(
  hello_test
  GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(hello_test)
```

### step 5: build and run test
```bash
my_project$ cmake -S . -B build
-- The C compiler identification is GNU 10.2.1
-- The CXX compiler identification is GNU 10.2.1
...
-- Build files have been written to: .../my_project/build

my_project$ cmake --build build
Scanning dependencies of target gtest
...
[100%] Built target gmock_main

my_project$ cd build && ctest
Test project .../my_project/build
    Start 1: HelloTest.BasicAssertions
1/1 Test #1: HelloTest.BasicAssertions ........   Passed    0.00 sec

100% tests passed, 0 tests failed out of 1

Total Test time (real) =   0.01 sec
```


## print vector to the console
```c++
#define print(v) std::copy(v.begin(), v.end(), std::ostream_iterator<int>(std::cout, " ")); std::cout << std::endl

// C++20
#define print(x) std::ranges::copy(x, std::ostream_iterator<int>(std::cout, " ")); std::cout << std::endl

```

## priority queue
### 1507 Shortest Subarray with Sum at Least K 和至少为 K 的最短子数组
[[https://www.lintcode.com/problem/1507/][Lintcode 1507 Shortest Subarray with Sum at Least K]]
#### Binary search on answer + priority_queue
```c++
class Solution {
 public:
  int shortestSubarray(std::vector<int>& A, int K) {
    std::vector<int> prefix_sum = GetPrefixSum(A);
    int left = 1;
    int right = A.size();
    while (left + 1 < right) {
      int mid = left + (right - left) / 2;
      if (IsValid(prefix_sum, mid, K)) {
        right = mid;
      } else {
        left = mid;
      }
    }

    if (IsValid(prefix_sum, left, K)) {
      return left;
    }
    if (IsValid(prefix_sum, right, K)) {
      return right;
    }
    return -1;
  }
 private:
  std::vector<int> GetPrefixSum(std::vector<int>& nums) {
    std::vector<int> answer(nums.size() + 1, 0);
    for (int i = 0; i < nums.size(); ++i) {
      answer[i + 1] = answer[i] + nums[i];
    }
    return answer;
  }

  bool IsValid(std::vector<int>& prefix_sum, int length, int K) {
    auto cmp = [](const std::pair<int, int>& a, const std::pair<int, int>& b) { return a.second > b.second; };
    std::set<std::pair<int, int>, decltype(cmp)> pq(cmp); // c++20 pq; c++11 pq(cmp)
    for (int end = 0; end < prefix_sum.size(); ++end) {
      int index = end - length - 1;
      if (index >= 0) {
        pq.erase(std::find_if(pq.begin(), pq.end(), [&index](const std::pair<int, int>& a) {
          return a.first == index;
        }));
      }
      if (!pq.empty() && prefix_sum[end] - pq.rbegin()->second >= K) {
        return true;
      }
      pq.insert(std::make_pair(end, prefix_sum[end]));
    }
    return false;
  }
};
```


## [LRU implementation](https://www.lintcode.com/problem/134/)

```c++
// C++
#include <unordered_map>

struct LinkedNode {
  LinkedNode(int key, int value, LinkedNode* next)
    : key(key), value(value), next(next) {}

  int key;
  int value;
  LinkedNode* next;
};

class LRUCache {
 public:
  LRUCache(int capacity)
    : capacity_(capacity), dummy_(new LinkedNode(0, 0, nullptr)), tail_(dummy_) {}

  // Google style: Get
  int Get(int key) {
    if (key_to_previous_.find(key) == key_to_previous_.end()) {
      return -1;
    }
    LinkedNode* previous = key_to_previous_.at(key);
    LinkedNode* current = previous->next;

    Kick(previous);
    return current->value;
  }

  // Google style: Set
  void Set(int key, int value) {
    if (key_to_previous_.find(key) != key_to_previous_.end()) {
      Kick(key_to_previous_.at(key));
      tail_->value = value;
      return;
    }

    PushBack(new LinkedNode(key, value, nullptr)); // 如果key不存在，则存入新节点
    if (key_to_previous_.size() > capacity_) { // 如果缓存超出上限
      PopFront();
    }
  }

 private:
  void PushBack(LinkedNode* node) {
    key_to_previous_[node->key] = tail_;
    tail_->next = node;
    tail_ = node;
  }

  void PopFront() { // 删除头部
    LinkedNode* head = dummy_->next;
    key_to_previous_.erase(head->key);
    dummy_->next = head->next;
    key_to_previous_[head->next->key] = dummy_;
  }

  // change "previous->node->next->...->tail_"
  // to "previous->next->...->tail_->node"
  void Kick(LinkedNode* previous) { // 将数据移至尾部
    LinkedNode* node = previous->next;
    if (node == tail_) {
      return;
    }

    // update the current node from linked list
    previous->next = node->next;

    // update the previous node in hash map
    key_to_previous_[node->next->key] = previous;
    node->next = nullptr;
    PushBack(node);
  }

  int capacity_;
  LinkedNode* dummy_;
  LinkedNode* tail_;

  std::unordered_map<int, LinkedNode*> key_to_previous_;
};
```

## [LIS Longest Increasing Subsequence](https://www.jiuzhang.com/problem/longest-increasing-subsequence/)

- 接龙规则：从左到右一个比一个大，该问题简称 LIS
- 状态表示：
  - A：`dp[i]` 表示前`i`个数的 LIS 是多长(前缀型, do not choose this)
  - B：`dp[i]` 表示以第`i`个数结尾的 LIS 是多长(坐标型)

### LIS 的动态规划四要素

- `state:` `dp[i]`表示以第`i`个数为龙尾的最长的龙有多长
- `function:` `dp[i] = max{dp[j] + 1}, j < i && nums[j] < nums[i]`
- `initialization:` `dp[0..n-1] = 1`
- `answer:` `max{dp[0..n-1]}`

```python
def longestIncreasingSubsequence(self, nums):
  if nums is None or not nums:
    return 0

  # state: dp[i] 表示以第i个数结尾的LIS的长度
  # initialization：dp[0..n-1] = 1
  dp = [1] * len(nums)

  # function: dp[i] = max(dp[i] + 1), j < i && nums[j] < nums[i]
  for i in range(len(nums)):
    for j in range(i):
      if nums[j] < nums[i]:
        dp[i] = max(dp[i], dp[j] + 1)

  # answer, 任意一个位置都可能是LIS的结尾
  return max(dp)
```

- 改动要点(返回最优方案)
  1. prev 数组记录前继最优状态
  2. max() 的写法要改为 if 的写法
  3. 找到最长龙的结尾，从结尾倒推出整条龙

```python
def longestIncreasingSubsequence(self, nums):
  if nums is None or not nums:
    return 0

  # state: dp[i] 表示以第i个数结尾的LIS的长度
  # initialization：dp[0..n-1] = 1
  dp = [1] * len(nums)

  # prev[i]代表dp[i]的最优值是从哪个dp[j]算过来的
  prev = [-1] * len(nums)

  # function dp[i] = max{dp[j] + 1}, j < i and nums[j] < nums[i]
  for i in range(len(nums)):
    for j in range(i):
      if nums[j] < nums[i] and dp[i] < dp[j] + 1:
        dp[i] = dp[j] + 1
        prev[i] = j

  # answer: max(dp[0..n-1])
  longest, last = 0, -1
  for i in range(len(nums)):
    if dp[i] > longest:
      longest = dp[i]
      last = i

  path = []
  while last != -1
    path.append(nums[last])
    last = prev[last]
  print(path[::-1])

  return longest
```

## [LIS2 Longest Continuous Increasing Subsequence 2](https://www.jiuzhang.com/problem/longest-continuous-increasing-subsequence-ii/)

```python
class Solution:
    """
    @param A: An integer matrix
    @return: an integer
    """
    def longestContinuousIncreasingSubsequence2(self, A):
        if not A or not A[0]:
            return 0

        n, m = len(A), len(A[0])
        points = []
        for i in range(n):
            for j in range(m):
                points.append((A[i][j], i, j))

        points.sort()

        longest_hash = {}
        for i in range(len(points)):
            key = (points[i][1], points[i][2])
            longest_hash[key] = 1
            for dx, dy in [(1, 0), (0, -1), (-1, 0), (0, 1)]:
                x, y = points[i][1] + dx, points[i][2] + dy
                if x < 0 or x >= n or y < 0 or y >= m:
                    continue
                if (x, y) in longest_hash and A[x][y] < points[i][0]:
                    longest_hash[key] = max(longest_hash[key], longest_hash[(x, y)] + 1)

        return max(longest_hash.values())
```

## [Largest Divisible Subset](https://www.jiuzhang.com/problem/largest-divisible-subset/)

```python
class Solution:
    def largestDivisibleSubset(self, nums):
        if not nums:
            return []

        nums = sorted(nums)
        n = len(nums)
        dp, prev = {}, {}
        for num in nums:
            dp[num] = 1
            prev[num] = -1

        last_num = nums[0]
        for num in nums:
            for factor in self.get_smaller_factors(num):
                if factor not in dp:
                    continue
                if dp[num] < dp[factor] + 1:
                    dp[num] = dp[factor] + 1
                    prev[num] = factor
            if dp[num] > dp[last_num]:
                last_num = num

        return self.get_path(prev, last_num)

    def get_smaller_factors(self, num):
        if num == 1:
            return []
        factor = 1
        factors = []
        while factor * factor <= num:
            if num % factor == 0:
                factors.append(factor)
                if factor * factor != num and factor != 1:
                    factors.append(num // factor)
            factor += 1
        return factors

    def get_path(self, prev, last_num):
        path = []
        while last_num != -1:
            path.append(last_num)
            last_num = prev[last_num]
        return path[::-1]
```

## HashMap Implementation
- [leetcode 705 design hashset](https://leetcode.com/problems/design-hashset/description/)

```c++
// C++
```

## sort lambda
```c++
    auto sortRuleLambda = [](const Skyscraper& s1, const Skyscraper& s2) -> bool {
      return s1.height() < s2.height();
    };
    std::sort(skyscrapers.begin(), skyscrapers.end(), sortRuleLambda);
```

## customized hash for unordered_map or unordered_set
```c++
struct pair_hash {
    template <class T1, class T2>
    std::size_t operator () (const std::pair<T1,T2> &p) const {
        auto h1 = std::hash<T1>{}(p.first);
        auto h2 = std::hash<T2>{}(p.second);

        // Mainly for demonstration purposes, i.e. works but is overly simple
        // In the real world, use sth. like boost.hash_combine
        return h1 ^ (h2 << 1);
    }
};

int main() {
  std::unordered_map<std::pair<int, int>, int, pair_hash> pos_index_map;
  return 0;
}
```

## function pointer in c++
```c++
int sum(int a, int b) {
  return a + b;
}

int prod(int a,  int b) {
  return a * b;
}

int shouldNotBeChanged(int (*operation)(int, int)) {
  srand(time(nullptr));
  int a = rand() % 100;
  int b = rand() % 100;
  printf("The result of the operation between %d and %d is %d\n",
         a, b, operation(a, b));
  return 0;
}

int main() {
  shouldNotBeChanged(&sum);
  return 0;
}
```

## element wise comparison of two structs
```c++
struct Point {
  float x;
  float y;
  Point(int x = 0, int y = 0) : x(x), y(y) {}
};

int main() {
  Point p1 = Point(1, 2);
  Point p2 = Point(2, 1);
  
  // std::tie can have any many parameters as it wants
  if (std::tie(p1.x, p2.x) == std::tie(p2.y, p1.y)) {
    std::cout << "haha" << std::endl;
  } else {
    std::cout << "nono" << std::endl;
  }
}
```

## how to use c++ build-in hash function
```c++
  size_t h1 = std::hash<char>()('a');
  size_t h2 = std::hash<char>()('b');
```

```c++
  std::unordered_map<std::string, int> myhash;
  std::unordered_map<std::string, int>::hasher fn = myhash.hash_function();
  std::cout << fn("apple") << std::endl;
```

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


## random seed
`3407`

## C++20 comparison operator
```c++
struct Point {
   int x;
   int y;
   Point() : x(0), y(0) {}
   Point(int a, int b) : x(a), y(b) {}

   // !!! have to write it this way:
   inline bool operator== (const Point& other) const {
     return x == other.x && y == other.y;
   }

};
```

## To initialize two dimentional array
```c++
#include<iostream>

int main() {
    int** secondStore;
    secondStore = new int*[10];
    for (int i = 0; i < 10; ++i) {
      secondStore[i] = new int[32];
    }
    std::cout << secondStore[0][0] << std::endl;
    return 0;
}
```

## heap: set vs priority_queue
- we cannot iterate `priority_queue`, but we can make a copy of it and then use 'pop' and 'top()' to iterate
```c++
#include <iostream>
#include <string>
#include <vector>
#include <set>
#include <iterator>
#include <math.h>
#include <cassert>
#include <queue>
#include <map>


int main() {
  auto cmp = [](const std::pair<int, int>& a, const std::pair<int, int>& b) {return a.first > b.first;};
  std::set<std::pair<int, int>, decltype(cmp)> my_heap_with_set(cmp); // get min heap
//   std::priority_queue<std::pair<int, int>, std::deque<std::pair<int, int>>, decltype(cmp)> my_heap_with_priority_queue(cmp); // get max heap
  std::priority_queue<std::pair<int, int>, std::deque<std::pair<int, int>>> my_heap_with_priority_queue; // get max heap

  my_heap_with_set.insert(std::make_pair(3, 1));
  my_heap_with_set.insert(std::make_pair(2, 1));
  my_heap_with_set.insert(std::make_pair(4, 1));
  my_heap_with_set.insert(std::make_pair(0, 1));

  my_heap_with_priority_queue.push({3, 1});
  my_heap_with_priority_queue.push({2, 1});
  my_heap_with_priority_queue.push({4, 1});
  my_heap_with_priority_queue.push({0, 1});

  auto it = my_heap_with_set.begin();
  std::cout << "my_set: " << std::endl;;
  for (; it != my_heap_with_set.end(); ++it) {
    std::cout << it->first << " " << it->second << std::endl;

  }
  std::cout << std::endl;


  std::cout << "my_priority_queue: " << std::endl;
  for (; !my_heap_with_priority_queue.empty(); my_heap_with_priority_queue.pop()) {
    std::cout << my_heap_with_priority_queue.top().first << " " << my_heap_with_priority_queue.top().second << std::endl;
  }
  std::cout << std::endl;

  std::cout << "test map iteration: " << std::endl;
  auto cmp2 = [](const int& a, const int& b) {return a > b;};
  std::map<int, int, decltype(cmp2)> my_map(cmp2);
  my_map[0] = 12;
  my_map[1] = 15;
  my_map[1111] = 111;
  for (auto i : my_map) { // works
    std::cout << i.first << " " << i.second << std::endl;
//   for (auto it = my_map.begin(); it != my_map.end(); ++it) { // works
//     std::cout << it->first << " " << it->second << std::endl;
  }
  std::cout << std::endl;

  std::cout << "test max_element for map: " << std::endl;
  auto cmp_max_element = [](const auto& a, const auto& b) {return a.second > b.second;};
  // be aware that we should use '->second' at the end, becuase max_element return iterator
  int temp = max_element(my_map.begin(), my_map.end(), cmp_max_element)->second;
  std::cout << temp << std::endl;
  std::cout << std::endl;
  return 0;
}
```

## heap with multiset, erase with find
```c++
// Leetcode 731. My calendar II(Sweep Line Algorithm)

#define print(x) std::copy(x.begin(), x.end(), std::ostream_iterator<int>(std::cout, " ")); std::cout << std::endl
class MyCalendarTwo {
 public:
  MyCalendarTwo() {}
    
  bool book(int start, int end) {
    v.insert({start, 1});
    v.insert({end, -1});

    // std::cout << "start: " << start << " end: " << end << std::endl;
    // for (auto e : v) {
    //     std::cout << e[0] << " " << e[1] << std::endl;
    // }

    if (IsValid()) {
      return true;
    } else {
      // Approach 1: with find_if
      //   auto index = std::find_if(v.begin(), v.end(), [&start](const auto& first) {
      //     return first[0] == start && first[1] == 1;
      //   });
      //   v.erase(index);
      //   index = std::find_if(v.begin(), v.end(), [&end](const auto& first) {
      //     return first[0] == end && first[1] == -1;
      //   });
      //   v.erase(index);

      // Approach 2: with find
      v.erase(v.find({start, 1}));
      v.erase(v.find({end, -1}));
      return false;

    }
  }

  bool IsValid() {
    // check if there is triple booking
    int count = 0;
    for (auto it = v.begin(); it != v.end(); ++it) {
      count += it->at(1);
      if (count >= 3) return false;
    }
    return true;
  }
  
  std::multiset<std::vector<int>> v;
}
```

## return min or max element from hashmap
```c++
auto cmp = [](const auto& a, const auto& b) {return a.second < b.second;};
min_value = min_element(my_map.begin(), my_map.end(), cmp)->second;
```

## all types of comparators for map and set
- focus on `const`, `*` and `&`
```c++
// version 1: const is required
class Comparator {
 public:
  bool operator()(const int& a, const int& b) const { // must have const here
    return a > b;
  }
};
std::map<int, int, Comparator> my_map;

// version 2
auto cmp = [](const std::pair<int, int>& a, const std::pair<int, int>& b) {return a.first > b.first;};
std::set<std::pair<int, int>, decltype(cmp)> my_heap_with_set(cmp); // get min heap

// version 3: * and & are required
bool comparator(const int& a, const int& b) {
  return a > b;
}
std::map<int, int, decltype(comparator)*> my_map(&comparator); 
```

## Comparator for sort vs map(or set)
- **sort** uses object or `cmp`
- **set** or **map** use typename or `decltype(cmp)`
### sort
```c++
class Comparator2 {
 public:
  Comparator2(int s): s_(s) {}
  bool operator()(const int& a, const int& b) const {
    if (s_ > 0) {
      return a > b;
    }
    return a < b;
  }
 private:
  int s_;
};
std::vector<int> vec{2, 1, 3, 7, 4};
std::sort(vec.begin(), vec.end(), Comparator2(-1)); // use object
```

### map(or set)
```c++
class Comparator {
 public:
  bool operator()(const int& a, const int& b) const {
    return a > b;
  }
};
std::map<int, int, Comparator> my_map_; // use typename
```

## use function to get lambda or func pointer
```c++
std::function<bool(int, int)> cmp = [](int x, int y){return x > y;};
```

### overload less comparator for priority queue
```c++
// leetcode 2353. Design a Food Rating System
#include <gmock/gmock.h>
#include <gtest/gtest.h>

#include <queue>

using namespace std;

class Food {
 public:
  // Store the food's rating.
  int food_rating;
  // Store the food's name.
  string food_name;

  Food(int food_rating, string food_name) {
    this->food_rating = food_rating;
    this->food_name = food_name;
  }

  // Overload the less than operator for comparison
  bool operator<(const Food& other) const {
    // If food ratings are the same sort on the basis of their name.
    // (lexicographically smaller name food will be on top)
    if (food_rating == other.food_rating) {
      return food_name > other.food_name;
    }
    // Sort on the basis of food rating. (bigger rating food will be on top)
    return food_rating < other.food_rating;
  }
};

class FoodRatings {
  // Map food with its rating.
  unordered_map<string, int> food_to_rating;
  // Map food with the cuisine it belongs to.
  unordered_map<string, string> food_to_cuisine;

  // Store all food of a cuisine in priority queue (to sort them on
  // ratings/name) Priority queue element -> Food: (food_rating, food_name)
  unordered_map<string, priority_queue<Food>> cuisine_to_food;

 public:
  FoodRatings(vector<string>& foods, vector<string>& cuisines,
              vector<int>& ratings) {
    for (int i = 0; i < foods.size(); ++i) {
      // Store 'rating' and 'cuisine' of current 'food' in 'food_to_rating' and
      // 'food_to_cuisine' maps.
      food_to_rating[foods[i]] = ratings[i];
      food_to_cuisine[foods[i]] = cuisines[i];
      // Insert the '(rating, name)' element in current cuisine's priority
      // queue.
      cuisine_to_food[cuisines[i]].push(Food(ratings[i], foods[i]));
    }
  }

  void changeRating(string food, int newRating) {
    // Update food's rating in 'food_rating' map.
    food_to_rating[food] = newRating;
    // Insert the '(new rating, name)' element in respective cuisine's priority
    // queue.
    auto cuisine_name = food_to_cuisine[food];
    cuisine_to_food[cuisine_name].push(Food(newRating, food));
  }

  string highestRated(string cuisine) {
    // Get the highest rated 'food' of 'cuisine'.
    auto highest_rated = cuisine_to_food[cuisine].top();

    // If the latest rating of 'food' doesn't match the 'rating' on which it was
    // sorted in the priority queue, then we discard this element of the
    // priority queue.
    while (food_to_rating[highest_rated.food_name] != highest_rated.food_rating) {
      cuisine_to_food[cuisine].pop();
      highest_rated = cuisine_to_food[cuisine].top();
    }
    // Return name of the highest rated 'food' of 'cuisine'.
    return highest_rated.food_name;
  }
};

```