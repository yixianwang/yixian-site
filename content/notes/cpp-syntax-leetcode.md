+++
title = 'Cpp Syntax Leetcode'
date = 2020-10-13T22:57:08-04:00
+++

Here’s a **comprehensive list of essential C++ syntax and language knowledge** you should master for solving coding problems efficiently on LeetCode — especially for interviews at top tech companies.

I’ve grouped them into **Beginner → Intermediate → Advanced** levels so you can build your mastery progressively.

---

## 🧱 1. **Basic C++ Syntax & Structure** (Fundamentals)

* ✅ **Basic program structure**

  * `#include <iostream>`
  * `using namespace std;`
  * `int main() { ... }`
* ✅ **Input & Output**

  * `cin >> x;` / `cout << x << endl;`
  * `printf` / `scanf` (for faster IO)
* ✅ **Variable declarations**

  * `int`, `long`, `double`, `char`, `bool`, `string`
  * Type modifiers: `long long`, `unsigned`
* ✅ **Operators**

  * Arithmetic: `+ - * / %`
  * Relational: `== != < <= > >=`
  * Logical: `&& || !`
  * Bitwise: `& | ^ ~ << >>`
  * Assignment: `= += -= *= ...`
* ✅ **Control flow**

  * `if`, `else if`, `else`
  * `switch` / `case`
  * `for`, `while`, `do-while`
  * `break`, `continue`, `return`

---

## 🧮 2. **Data Structures Syntax**

* ✅ **Arrays**

  * Static arrays: `int arr[100];`
  * Dynamic arrays via `vector`
* ✅ **Strings**

  * `string s;` — `s.size()`, `s.substr()`, `s.find()`, `s.push_back()`
  * `s[i]` indexing
* ✅ **Vectors (`std::vector`)**

  * `vector<int> v;`
  * `push_back`, `pop_back`, `size`, `clear`, `empty`
  * `v.begin()`, `v.end()`
  * Initialization: `vector<int> v(n, 0);`
* ✅ **Stacks / Queues / Deques**

  * `stack<int> s;` → `push`, `pop`, `top`, `empty`
  * `queue<int> q;` → `push`, `pop`, `front`, `back`
  * `deque<int> dq;` → double-ended operations
* ✅ **Priority Queue / Heap**

  * `priority_queue<int>` (max heap)
  * `priority_queue<int, vector<int>, greater<int>>` (min heap)
* ✅ **Sets & Maps**

  * `set<int>` / `unordered_set<int>`
  * `map<int, int>` / `unordered_map<int, int>`
  * `insert`, `erase`, `find`, `count`, `[]`
* ✅ **Pairs & Tuples**

  * `pair<int,int> p = {1,2};` → `p.first`, `p.second`
  * `tuple<int,int,int> t;` / `tie(a,b,c) = t;`

---

## 🧠 3. **Functions & Scope**

* ✅ Function definition & declaration

  * `int add(int a, int b) { return a + b; }`
* ✅ Pass by value / reference (`&`)

  * `void f(int& x) { x++; }`
* ✅ Recursion syntax

  * Base case & recursive calls
* ✅ Function overloading
* ✅ Default parameters
* ✅ Inline functions (`inline`)

---

## 🧰 4. **Memory & Pointers**

* ✅ Pointer basics

  * `int* p = &x;`, `*p`, `&x`
* ✅ `nullptr` vs `NULL`
* ✅ Dynamic memory

  * `new` and `delete`
  * `int* arr = new int[n];`
* ✅ Reference (`&`) vs pointer (`*`)
* ✅ Passing pointers to functions
* ✅ Smart pointers (basic familiarity): `unique_ptr`, `shared_ptr` *(rare in LeetCode but useful)*

---

## 🧭 5. **Classes, Structs & OOP**

* ✅ `struct` and `class` definition

  * Members, methods, constructors
* ✅ Access modifiers: `public`, `private`, `protected`
* ✅ `this` pointer
* ✅ Constructors & Destructors
* ✅ `const` methods (`int get() const { ... }`)
* ✅ Operator overloading (optional)
* ✅ `friend` functions (rare)
* ✅ Inheritance & polymorphism *(only needed for some design problems)*

---

## 🧮 6. **STL Algorithms (Very Important)**

* ✅ `#include <algorithm>`

  * `sort(v.begin(), v.end());`
  * `reverse(v.begin(), v.end());`
  * `max_element`, `min_element`
  * `binary_search`, `lower_bound`, `upper_bound`
  * `accumulate` (with `#include <numeric>`)
* ✅ `#include <functional>` (e.g., `greater<int>()`)
* ✅ `next_permutation`, `prev_permutation`
* ✅ `count`, `find`, `unique`

👉 Mastering STL will save you **a lot of time** in LeetCode.

---

## 🧭 7. **Common Patterns & Syntax**

* ✅ Range-based for loops

  * `for (int x : v) { ... }`
* ✅ Lambda functions

  * `auto cmp = [](int a, int b){ return a > b; };`
  * `sort(v.begin(), v.end(), cmp);`
* ✅ `auto` keyword
* ✅ `typedef` / `using` aliases

  * `using ll = long long;`
* ✅ Initializer list: `{1, 2, 3}`
* ✅ `emplace_back` vs `push_back`
* ✅ `const` correctness

---

## 🧮 8. **Advanced C++ (LeetCode-Useful)**

* ✅ `std::function` for passing functions around
* ✅ Custom comparator for priority queue, sort, set/map

  * `struct cmp { bool operator()(...) const { ... } };`
* ✅ Lambda with capture
* ✅ Recursion with lambda (`std::function<void(...)> dfs = [&](...) { ... };`)
* ✅ `vector<vector<int>>` and multi-dimensional containers
* ✅ `memset` for initializing arrays
* ✅ `fill` and `assign` for containers

---

Example: 
`int dist[1000];`
`memset(dist, 0x3f, sizeof(dist)); // sets all ints to 0x3f3f3f3f`


## ⚡ 9. **Time & Space Optimization Tricks**

* `ios::sync_with_stdio(false);`
* `cin.tie(nullptr);`
* Avoid unnecessary copies (use references `&`)
* Use `reserve()` for vectors to prevent reallocations
* Use bit operations for performance in some problems

---

## 🧠 10. **C++17/20 Features That Can Help**

(These aren’t strictly required, but can make code cleaner.)

* `structured bindings`:

  ```cpp
  auto [a, b] = p;
  ```
* `if with initializer`

  ```cpp
  if (auto it = mp.find(x); it != mp.end()) { ... }
  ```
* `constexpr`, `inline` variables
* `std::optional` (occasionally useful)
* `std::variant` (rare on LeetCode)

---

## 📌 BONUS: C++ Syntax Patterns You’ll Use Repeatedly

| Pattern                     | Usage                                                                 |
| --------------------------- | --------------------------------------------------------------------- |
| DFS/BFS recursion           | `function<void(int)> dfs = [&](int u){ ... };`                        |
| Graph adjacency list        | `vector<vector<int>> g(n);`                                           |
| Sliding window              | `int l=0, r=0; while(r<n){...}`                                       |
| Binary search               | `int l=0, r=n-1; while(l<=r){...}`                                    |
| Two pointers                | `while (l<r) {...}`                                                   |
| Prefix sum                  | `vector<int> pre(n+1,0);`                                             |
| Heap with custom comparator | `priority_queue<pair<int,int>, vector<pair<int,int>>, greater<>> pq;` |

---

✅ **Recommendation for mastering LeetCode with C++**:

1. Be fully comfortable with `vector`, `string`, and STL algorithms.
2. Learn how to use custom comparators with sort and priority queue.
3. Get used to writing fast I/O setup (`ios::sync_with_stdio(false)` + `cin.tie(0)`).
4. Practice recursion and lambda patterns (great for backtracking & DFS problems).
5. Know your containers — which one to use for O(1) or O(log n).

---

If you want, I can also give you a **C++ LeetCode cheat sheet** (a single file with templates for common problems like DFS, BFS, binary search, heap, union find, DP, etc.).
👉 Do you want me to generate that file for you? (Yes/No)

```cpp
// C++ LeetCode Cheat Sheet
// Single-file templates & snippets: paste into LeetCode editor and modify per problem.

#include <bits/stdc++.h>
using namespace std;

// --- Common type aliases ---
using ll = long long;
using pii = pair<int,int>;
using vi = vector<int>;
using vvi = vector<vi>;

// --- Fast I/O (useable in local contests; LeetCode ignores sync flags) ---
static auto __fast_io = [](){
  ios::sync_with_stdio(false);
  cin.tie(nullptr);
  return 0;
}();

// --- Utility helpers ---
template<class T> void chmin(T &a, const T &b){ if(b < a) a = b; }
template<class T> void chmax(T &a, const T &b){ if(b > a) a = b; }

// --- Common constants ---
const int INF = 1e9;
const ll LINF = (ll)4e18;

// ---------------------------
// 1) Basic templates
// ---------------------------

// Function template
int add(int a, int b){
  return a + b;
}

// Lambda example
auto cmp = [](int a, int b){ return a > b; };

// ---------------------------
// 2) Binary Search (classic) -- on index 0..n-1 where predicate is monotonic
// ---------------------------
int binary_search_index(int n, function<bool(int)> good){
  int l = 0, r = n - 1, ans = -1;
  while(l <= r){
    int m = l + (r - l) / 2;
    if(good(m)){
      ans = m; r = m - 1;
    } else l = m + 1;
  }
  return ans;
}

// ---------------------------
// 3) Two pointers / Sliding window
// ---------------------------
int count_subarrays_with_sum_at_most_k(const vector<int>& a, int k){
  int n = a.size();
  long long sum = 0; int l = 0; int cnt = 0;
  for(int r=0;r<n;++r){
    sum += a[r];
    while(l <= r && sum > k){ sum -= a[l++]; }
    cnt += (r - l + 1);
  }
  return cnt;
}

// ---------------------------
// 4) DFS (recursive) & backtracking template
// ---------------------------
void dfs_recursive(int u, const vector<vector<int>>& g, vector<int>& vis){
  vis[u] = 1;
  for(int v: g[u]) if(!vis[v]) dfs_recursive(v,g,vis);
}

// Backtracking example: generate permutations
void backtrack_perms(vector<int>& a, vector<int>& cur, vector<bool>& used, vector<vector<int>>& out){
  if((int)cur.size() == (int)a.size()){ out.push_back(cur); return; }
  for(int i=0;i<(int)a.size();++i){
    if(used[i]) continue;
    used[i] = true;
    cur.push_back(a[i]);
    backtrack_perms(a,cur,used,out);
    cur.pop_back();
    used[i] = false;
  }
}

// ---------------------------
// 5) BFS template (shortest path in unweighted graph)
// ---------------------------
vector<int> bfs_dist(int s, const vector<vector<int>>& g){
  int n = g.size();
  vector<int> dist(n, -1);
  queue<int>q; q.push(s); dist[s]=0;
  while(!q.empty()){
    int u=q.front(); q.pop();
    for(int v: g[u]) if(dist[v]==-1){ dist[v]=dist[u]+1; q.push(v); }
  }
  return dist;
}

// ---------------------------
// 6) Priority queue (heap) - min and max
// ---------------------------
// Max-heap: 
priority_queue<int> pq;
// Min-heap: 
priority_queue<int, vector<int>, greater<int>> pq;

// Example: k smallest elements
vector<int> k_smallest(const vector<int>& a, int k){
  priority_queue<int> pq;
  for(int x: a){
    pq.push(x);
    if((int)pq.size() > k) pq.pop();
  }
  vector<int> res;
  while(!pq.empty()){ res.push_back(pq.top()); pq.pop(); }
  reverse(res.begin(), res.end());
  return res;
}

// ---------------------------
// 7) Union-Find (Disjoint Set Union)
// ---------------------------
struct DSU{
  int n; vector<int> p, r;
  DSU(int n=0): n(n), p(n), r(n,0){ iota(p.begin(), p.end(), 0); }
  int find(int x){ return p[x]==x?x:p[x]=find(p[x]); }
  bool unite(int a,int b){
    a=find(a); b=find(b); if(a==b) return false;
    if(r[a]<r[b]) swap(a,b);
    p[b]=a; if(r[a]==r[b]) r[a]++;
    return true;
  }
};

// ---------------------------
// 8) Common STL usages & patterns
// ---------------------------

// sort vector
sort(v.begin(), v.end());
// sort by custom comparator
sort(v.begin(), v.end(), [](auto &x, auto &y){ return x.second < y.second; });

// lower_bound / upper_bound (on sorted container)
auto it = lower_bound(v.begin(), v.end(), value);
int idx = it - v.begin();

// unique to remove consecutive duplicates
v.erase(unique(v.begin(), v.end()), v.end());

// prefix sum
vector<ll> pref(n+1,0); for(int i=0;i<n;++i) pref[i+1]=pref[i]+a[i];

// ---------------------------
// 9) DP templates (top-down & bottom-up)
// ---------------------------

// Top-down memoization example (Fibonacci)
vector<ll> memo_fib;
ll fib_td(int n){
  if(n<=1) return n;
  if(memo_fib[n] != -1) return memo_fib[n];
  return memo_fib[n] = fib_td(n-1) + fib_td(n-2);
}

// Bottom-up DP example
ll fib_bu(int n){
  if(n<=1) return n;
  ll a=0,b=1;
  for(int i=2;i<=n;i++){ ll c=a+b; a=b; b=c; }
  return b;
}

// ---------------------------
// 10) Graph algorithms (Dijkstra, TopoSort)
// ---------------------------

vector<ll> dijkstra(int src, const vector<vector<pair<int,int>>>& g){
  int n = g.size();
  vector<ll> dist(n, LINF);
  priority_queue<pair<ll,int>, vector<pair<ll,int>>, greater<pair<ll,int>>> pq;
  dist[src]=0; pq.push({0,src});
  while(!pq.empty()){
    auto [d,u] = pq.top(); pq.pop();
    if(d!=dist[u]) continue;
    for(auto [v,w]: g[u]){
      if(dist[v] > dist[u] + w){
        dist[v] = dist[u] + w;
        pq.push({dist[v], v});
      }
    }
  }
  return dist;
}

vector<int> topo_sort(int n, const vector<vector<int>>& g){
  vector<int> indeg(n,0);
  for(int u=0;u<n;++u) for(int v: g[u]) indeg[v]++;
  queue<int> q; for(int i=0;i<n;++i) if(indeg[i]==0) q.push(i);
  vector<int> order;
  while(!q.empty()){
    int u=q.front(); q.pop(); order.push_back(u);
    for(int v: g[u]) if(--indeg[v]==0) q.push(v);
  }
  if((int)order.size()!=n) return {}; // cycle
  return order;
}

// ---------------------------
// 11) Trie (prefix tree) -- common string problem template
// ---------------------------
struct TrieNode{
  array<int,26> nxt;
  bool end=false;
  TrieNode(){ nxt.fill(-1); }
};
struct Trie{
  vector<TrieNode> t;
  Trie(){ t.emplace_back(); }
  void insert(const string &s){
    int cur=0;
    for(char ch: s){ int c=ch-'a'; if(t[cur].nxt[c]==-1){ t[cur].nxt[c]=t.size(); t.emplace_back(); } cur=t[cur].nxt[c]; }
    t[cur].end=true;
  }
  bool search(const string &s){ int cur=0; for(char ch: s){ int c=ch-'a'; if(t[cur].nxt[c]==-1) return false; cur=t[cur].nxt[c]; } return t[cur].end; }
};

// ---------------------------
// 12) Segment Tree (range sum) -- iterative (bottom-up)
// ---------------------------
struct SegTree{
  int n; vector<ll> t;
  SegTree(int _n=0){ init(_n); }
  void init(int _n){ n=1; while(n<_n) n<<=1; t.assign(2*n,0); }
  void build(const vector<ll>& a){
    int m = a.size(); init(m);
    for(int i=0;i<m;i++) t[n+i]=a[i];
    for(int i=n-1;i>0;i--) t[i]=t[i<<1]+t[i<<1|1];
  }
  void update(int p, ll val){
    p += n; t[p] = val;
    while(p>1){ p>>=1; t[p] = t[p<<1] + t[p<<1|1]; }
  }
  ll query(int l, int r){ // inclusive l,r
    ll res=0; l+=n; r+=n;
    while(l<=r){
      if(l&1) res += t[l++];
      if(!(r&1)) res += t[r--];
      l >>= 1; r >>= 1;
    }
    return res;
  }
};

// ---------------------------
// 13) String utilities
// ---------------------------
vector<int> prefix_function(const string& s){
  int n=s.size(); vector<int> pi(n);
  for(int i=1;i<n;i++){
    int j = pi[i-1];
    while(j>0 && s[i]!=s[j]) j = pi[j-1];
    if(s[i]==s[j]) ++j;
    pi[i]=j;
  }
  return pi;
}

// ---------------------------
// 14) Common snippets & tips
// ---------------------------

// Reserve vector capacity to avoid reallocations
v.reserve(1000);

// Use references to avoid copies when iterating large objects
for(const auto &x : bigVec) { ... }

// Use move semantics when returning big containers (RVO helps)

// Use stable sort if order matters: 
stable_sort(begin,end,comp);

// ---------------------------
// 15) Problem-specific templates (examples)
// ---------------------------

// Example: Two-sum (hashmap)
vector<int> twoSum(const vector<int>& nums, int target){
  unordered_map<int,int> mp;
  for(int i=0;i<(int)nums.size();++i){
    int need = target - nums[i];
    if(mp.count(need)) return {mp[need], i};
    mp[nums[i]] = i;
  }
  return {};
}

// Example: Merge intervals (sort + sweep)
vector<vector<int>> mergeIntervals(vector<vector<int>>& intervals){
  if(intervals.empty()) return {};
  sort(intervals.begin(), intervals.end());
  vector<vector<int>> res;
  res.push_back(intervals[0]);
  for(auto &it: intervals){
    auto &last = res.back();
    if(it[0] <= last[1]) last[1] = max(last[1], it[1]);
    else res.push_back(it);
  }
  return res;
}

// Example: Reverse linked list (iterative) - LeetCode singly-linked-list structure assumed
ListNode* reverseList(ListNode* head){
  ListNode *prev=nullptr, *cur=head;
  while(cur){ ListNode* nxt=cur->next; cur->next=prev; prev=cur; cur=nxt; }
  return prev;
}

// ---------------------------
// End of cheat sheet
// ---------------------------

int main(){
  // This file is a template repository. Main left empty.
  return 0;
}
```