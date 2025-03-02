+++
title = 'DP Memo to Iteration'
date = 2025-03-01T23:36:58-05:00
+++

## 198 - House Robber
```Python
class Solution:
  def rob(self, nums: List[int]) -> int:
    n = len(nums)
    f0 = f1 = 0
    for i, x in enumerate(nums):
      f0, f1 = f1, max(f0 + x, f1)
    return f1
    # cahce = [-1] * n
    # def dfs(i):
    #  if i < 0:
    #    return 0
    #  if cache[i] != -1:
    #    return cache[i]
    #  cache[i] = max(dfs(i - 1), dfs(i - 2) + nums[i])
    #  return cache[i]
```

```c++
class Solution {
 public:
  int rob(vector<int>& nums) {
    // int n = nums.size();
    // int f0 = 0, f1 = 0;
    // for (int i = 0; i < n; ++i) {
    //   int x = nums[i];
    //   int new_f1 = max(f0 + x, f1);
    //   f0 = f1;
    //   f1 = new_f1;
    // }
    // return f1;

    // Below is the optional recursive + memoized (DFS + cache) version
    int n = nums.size();
    vector<int> cache(n, -1);
    return dfs(n - 1, nums, cache);
  }

  int dfs(int i, vector<int>& nums, vector<int>& cache) {
      if (i < 0) return 0;
      if (cache[i] != -1) return cache[i];
      cache[i] = max(dfs(i - 1, nums, cache), (i >= 1 ? dfs(i - 2, nums, cache) : 0) + nums[i]);
      return cache[i];
  }

  // // corner cases
  // if (nums.size() == 0) return 0;
  // if (nums.size() == 1) return nums[0];

  // // dp
  // // f[i] represents: max money by robbing previous i houses
  // vector<int> f(3, 0);
  // f[0] = nums[0];
  // f[1] = max(nums[0], nums[1]);
  // for (int i = 2; i < nums.size(); ++i) {
  //   f[i % 3] = max(nums[i] + f[(i - 2) % 3], f[(i - 1) % 3]);
  // }
  // return f[(nums.size() - 1) % 3];
};
```