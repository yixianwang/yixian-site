+++
title = 'C++ Comparator'
date = 2024-03-31T02:31:00-04:00
+++

## Comparator - set
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
  // bool operator()(Node* const& left, Node* const& right) const { // works
  // bool operator()(Node* left, Node* right) const { // works
  bool operator()(const Node* left, const Node* right) const { // works
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

## Comparator - priority_queue
- [Leetcode 23. Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/)

```c++
// Comparison function for priority queue
struct CompareNodes {
  bool operator()(const ListNode* lhs, const ListNode* rhs) const {
    return lhs->val > rhs->val;
  }
};

class Solution {
 public:
  ListNode* mergeKLists(vector<ListNode*>& lists) {
    ListNode* head = new ListNode(0);
    ListNode* point = head;

    // Define priority queue with custom comparison function
    priority_queue<ListNode*, vector<ListNode*>, CompareNodes> q;

    // Push the heads of all lists into the priority queue
    for (ListNode* l : lists) {
      if (l) {
        q.push(l);
      }
    }

    // Merge the lists
    while (!q.empty()) {
      ListNode* node = q.top();
      q.pop();

      // Add the current smallest node to the merged list
      point->next = new ListNode(node->val);
      point = point->next;

      // Move the pointer of the current list forward
      node = node->next;

      // If there's remaining elements in the current list, push it to the
      // priority queue
      if (node) {
        q.push(node);
      }
    }

    return head->next;
  }
};
```