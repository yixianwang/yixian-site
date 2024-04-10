+++
title = 'Union Find'
date = 2024-04-07T00:14:28-04:00
+++


Coverd all topics of Union Find

It's a data structure that supports fast merging and searching of sets
- O(1) merge the two sets where `x` and `y` are located: `Merge(x, y)` -- connect the roots
- O(1) find the set to which `x` belongs: `Find(x)` -- find the root
- O(1) check wheter `x` and `y` are in the same set: `IsConnected(x, y)` -- check if they have the same root

<!--more-->
- Graph: **may** have cycle
- Tree: no cycle
- Necessary and sufficient conditions for a graph to be a tree:
  1. There are `n` vertices on the graph and only `n-1` edges.
  2. `n` points are connected (belong to the same connected block)

## Leetcode 261. Graph Valid Tree
- [Leetcode 261. Graph Valid Tree](https://leetcode.com/problems/graph-valid-tree/description/)

### BFS
```c++
class Solution {
 public:
  bool validTree(int n, vector<vector<int>>& edges) {
    // checking for condition 1
    if (edges.size() + 1 != n) return false;
    
    // build graph
    unordered_map<int, vector<int>> graph;
    for (int i = 0; i < edges.size(); ++i) {
      graph[edges[i][0]].push_back(edges[i][1]);
      graph[edges[i][1]].push_back(edges[i][0]);
    }

    // BFS: checking for condition 2
    deque<int> q;
    unordered_set<int> visited;
    q.push_back(0);
    visited.insert(0);
    while (!q.empty()) {
      int size = q.size();
      for (int i = 0; i < size; ++i) {
        int curr = q.front();
        q.pop_front();
        for (int j = 0; j < graph[curr].size(); ++j) {
          if (visited.find(graph[curr][j]) != visited.end()) continue;
          q.push_back(graph[curr][j]);
          visited.insert(graph[curr][j]);
        }
      }
    }
    return visited.size() == n;
  }
};
```

### Follow-up(Union Find): come up with a better approach for AddEdge(x, y) and IsValidTree()
- 解决连通性问题的利器 -- Union Find

- [Lintcode 444. Graph Valid Tree II](https://www.lintcode.com/problem/444/description)

```c++
class Solution {
 public:
  void addEdge(int a, int b) {
  }

  bool isValidTree() {
  }
};
```