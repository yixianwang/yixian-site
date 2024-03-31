+++
title = 'C++ Comparator'
date = 2024-03-31T02:31:00-04:00
+++

## Comparator
- [Leetcode 3102. Minimize Manhattan Distances](https://leetcode.com/problems/minimize-manhattan-distances/description/)

```c++
class Node {
 public:
  Node(int dist) : sum(dist) {}
  int first;
  int second;
  int sum;
};

class Comparator {
 public:
  // bool operator()(const int& a, const int& b) const {
  //   return a > b;
  // }
  bool operator()(Node* const& left, Node* const& right) const {
    if (left->sum == right->sum) {
      if (left->first == right->first) {
        return left->second < right->second;
      }
      return left->first < right->first;
    }
    return left->sum > right->sum;
  }
};

bool comp(Node* const& left, Node* const& right) {
  if (left->sum == right->sum) {
    if (left->first == right->first) {
      return left->second < right->second;
    }
    return left->first < right->first;
  }
  return left->sum > right->sum;
}

class Solution {
 public:
  int minimumDistance(vector<vector<int>>& nums) {
    if (nums.size() < 2) return -1;

    // set<Node*, decltype(&comp)> heap; // not work
    // set<Node*, decltype(&comp)> heap(&comp); // works
    // set<Node*, decltype(comp)*> heap(&comp); // works
    set<Node*, Comparator> heap; // works

    for (int i = 0; i < nums.size(); ++i) {
      for (int j = i + 1; j < nums.size(); ++j) {
        Node* node = new Node(Distance(nums[i][0], nums[j][0], nums[i][1], nums[j][1]));
        node->first = i;
        node->second = j;
        heap.insert(node);
      }
    }

    int min_val = INT_MAX;
    // iterate remove each
    for (int i = 0; i < nums.size(); ++i) {
      // remove i, then compete
      min_val = min(min_val, Find(heap, i));
    }
    return min_val == INT_MAX ? -1 : min_val;
  }

  int Find(set<Node*, Comparator>& heap, int idx) {
    for (auto it = heap.begin(); it != heap.end(); ++it) {
      if ((*it)->first != idx && (*it)->second != idx) {
        return (*it)->sum;
      }
    }
    return -1;
  }

  int Distance(int& x1, int& x2, int& y1, int& y2) {
    return abs(x1 - x2) + abs(y1 - y2);
  }
};
```