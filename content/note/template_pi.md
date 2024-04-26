+++
title = 'Template PI'
date = 2023-11-04T17:51:02-04:00
+++

```cpp
// 138 subarray_sum
// 1. Official solution:
#include <vector>
#include <numeric>
#include <iostream>
#include <cassert>
#include <unordered_map>

#define assertm(exp, msg) assert(((void)msg, exp))
#define print(input) for (auto& elem : input) std::cout << elem << std::endl

class Solution {
 public:
  std::vector<int> subarraySum(std::vector<int>& nums) {
    std::vector<int> result;

    // 
    std::unordered_map<int, int> hash_table = {{0, -1}};
    int sum = 0;
    for (int i = 0; i < nums.size(); ++i) {
      sum += nums[i];
      if (hash_table.find(sum) != hash_table.end()) {
        result.push_back(hash_table[sum] + 1);
        result.push_back(i);
        break;
      }
      hash_table[sum] = i;
    }
    return result;
  }
};

int main() {
  Solution solution = Solution();
  std::vector<int> input{1, 0, 1};
  std::vector<int> expect_output{1};
  std::vector<int> output = solution.subarraySum(input);

  print(output);
  assertm(output == expect_output, "wrong answer");
}

/*
// 2. Mine solution: excced time limitation
#include <vector>
#include <numeric>
#include <iostream>
#include <cassert>

#define assertm(exp, msg) assert(((void)msg, exp))

class Solution {
 public:
  std::vector<int> subarraySum(std::vector<int>& nums) {
    std::vector<int> result;
    if (nums.size() == 0) {
      return result;
    }
    int size = nums.size();
    if (size == 1 && nums[0] == 0) {
      return nums;
    }
    for (int left = 0; left < size - 1; ++left) {
      if (nums[left] == 0) {
        result.push_back(left);
        result.push_back(left);
        return result;
      }
      for (int right = left + 1; right < size; ++right) {
        if (accumulate(nums.begin() + left, nums.begin() + right + 1, 0) == 0) {
          result.push_back(left);
          result.push_back(right);
          return result;
        }
      }
    }
    return result;
  }
};

int main() {
  Solution solution = Solution();
  std::vector<int> input{1, 0, 1};
  std::vector<int> expect_output{1};
  std::vector<int> output = solution.subarraySum(input);
  assertm(solution.subarraySum(input) == expect_output, "Hello assert");
}
*/
```