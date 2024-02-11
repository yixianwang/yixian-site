+++
title = 'Z Function'
date = 2024-02-10T23:22:25-05:00
+++

<!--more-->

- [Leetcode 3031. Minimum Time to Revert Word to Initial State II](https://leetcode.com/problems/minimum-time-to-revert-word-to-initial-state-ii/description/)

```c++
class Solution {
 public:
  int minimumTimeToInitialState(string word, int k) {
    // z function
    auto z = z_function(word);
    // auto z = z_function_trivial(word);

    for (int i = k; i < word.size(); i += k) {
      // if (word.substr(i, word.size() - i) == word.substr(0, word.size() - i))
      // return i / k;
      if (z[i] == word.size() - i) return i / k;
    }
    return ceil((double)word.size() / k);
  }

  vector<int> z_function(const string &s) {
    int n = s.size();
    vector<int> z(n);
    z[0] = n;
    for (int i = 1, l = 0, r = 0; i < n; i++) {
      if (i <= r) z[i] = min(z[i - l], r - i + 1);
      for (int &j = z[i]; i + j < n && s[j] == s[i + j]; j++);
      if (z[i] > r - i + 1) l = i, r = i + z[i] - 1;
    }
    return z;
  }

  vector<int> z_function_trivial(string s) {
    int n = s.size();
    vector<int> z(n);
    for (int i = 1; i < n; i++) {
        while (i + z[i] < n && s[z[i]] == s[i + z[i]]) {
            z[i]++;
        }
    }
    return z;
}
};
```