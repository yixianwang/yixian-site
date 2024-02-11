+++
title = 'Z Algorithm'
date = 2024-02-10T23:22:25-05:00
+++

<!--more-->

## Z Algo template
```c++
  vector<int> ZAlgo(const string& input) {
    vector<int> Z(input.size());
    int left = 0;
    int right = 0;
    for (int k = 1; k < input.size(); k++) {
      if (k > right) {
        left = right = k;
        while (right < input.size() && input[right] == input[right - left]) {
          right++;
        }
        Z[k] = right - left;
        right--;
      } else {
        // we are operating inside box
        int k1 = k - left;
        // if value does not stretches till right bound then just copy it.
        if (Z[k1] < right - k + 1) {
          Z[k] = Z[k1];
        } else {  // otherwise try to see if there are more matches.
          left = k;
          while (right < input.size() && input[right] == input[right - left]) {
            right++;
          }
          Z[k] = right - left;
          right--;
        }
      }
    }
    return Z;
  }
};
```

### Example: Z Algo
- [Leetcode 3036. Number of Subarrays That Match a Pattern II](https://leetcode.com/problems/number-of-subarrays-that-match-a-pattern-ii/description/)



## Z function template
```c++
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
```

### Example: Z Function
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