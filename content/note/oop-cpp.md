+++
title = 'OOP C++'
date = 2024-01-01T02:12:46-05:00
+++

## Leetcode 380. Insert Delete GetRandom O(1)
- [leetcode 380](https://leetcode.com/problems/insert-delete-getrandom-o1/description/?envType=study-plan-v2&envId=top-interview-150)

```c++
// #include <cstdlib>
// #include <ctime>
// #include <unordered_map>
// #include <vector>

class RandomizedSet {
 private:
  std::unordered_map<int, int> dict;
  std::vector<int> list;
  // std::rand rand;

 public:
  /** Initialize your data structure here. */
  RandomizedSet() { std::srand(std::time(0)); }

  /** Inserts a value to the set. Returns true if the set did not already
   * contain the specified element. */
  bool insert(int val) {
    if (dict.find(val) != dict.end()) return false;

    dict[val] = list.size();
    list.push_back(val);
    return true;
  }

  /** Removes a value from the set. Returns true if the set contained the
   * specified element. */
  bool remove(int val) {
    if (dict.find(val) == dict.end()) return false;

    int lastElement = list.back();
    int idx = it->second;

    list[idx] = lastElement;
    dict[lastElement] = idx;

    list.pop_back();
    dict.erase(val);

    return true;
  }

  /** Get a random element from the set. */
  int getRandom() { return list[std::rand() % list.size()]; }
};
```