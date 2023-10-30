+++
title = 'Monotonic Stack'
date = 2023-09-16T11:20:11-04:00
+++

Coverd all topics of Monotonic Stack
<!--more-->

# 1
- [Lintcode 1852 最终优惠价](https://www.lintcode.com/problem/1852/)

## 解释
- 只要单调栈中的元素开始出栈，证明它们应该开始被计算结果。<==> 如果它们要被计算结果，我们要把他们出栈。

## 总结
- 单调栈在入栈之前，要判断单调性存不存在：如果不存在，我们要不断地弹出，直到单调性重新存在。

## 复杂度分析
- 由于每个下标都最多入栈、出栈各一次
- 总时间复杂度为O(n + n) = O(n)
- 空间复杂度为O(n)
- 单调栈的特点：时空复杂度O(n)、编程复杂度低，思维复杂度高

## 注意
- 单调栈的单调性，从一开始到最后，都应该保持一致。
- 单个元素，单调性存在。
- 如果发现我的算法需要将一个元素，反复入栈，反复出栈，就不是单调栈算法，不符合单调栈最基本的特点。

## Template
```python
for i from 0 to (n - 1)
  while 栈不空 and 单调性不存在
    记录此时的答案 # 一般情况下是放在弹出栈之前的(弹前，弹中，弹后)
    stack.pop()
  stack.push(i) # 是下标，不是值
```

## Answer
```c++
class Solution {
 public:
  std::vector<int> finalDiscountedPrice(std::vector<int>& prices) {
    std::deque<int> stack;
    std::vector<int> results(prices.begin(), prices.end());
    for (int i = 0; i < prices.size(); ++i) {
      while (!stack.empty() && prices[stack.back()] >= prices[i]) {
        results[stack.back()] = prices[stack.back()] - prices[i];
        stack.pop_back();
      }
      stack.push_back(i);
    }
    return results;
  }
};
```

```python
def final_discounted_price(self, prices: List[int]) -> List[int]:
    stack = []
    results = list(prices)
    for i in range(len(prices)):
        while stack and prices[stack[-1]] >= prices[i]:
            results[stack[-1]] = prices[stack[-1]] - prices[i]
            stack.pop(-1)
        stack.append(i)
    return results
```

## Time Complexity
- 与同向双指针类似，在双指针中，每个元素最多被每个指针扫过一次，所以每个元素最多被扫过两次，总共2n次 ==> O(N)
```python
# 同向双指针模版
  end = 0
  for start in range(len):
    # 不满足则循环到满足搭配为止
    while end < len and (start 到 end 之间不满足条件):
      end += 1
    if start 到 end 之间满足条件:
      处理 start 到 end 这段区间(处理start, end这次搭配)
```
- 单调栈中，每一个下标最多入栈或出栈一次（即只入，或入+出），总共2n次 ==> O(N)

# 2 
- [Lintcode 285 高楼大厦](https://www.lintcode.com/problem/285/)

## 解法一：Brute Force
- 枚举下标，分别向左向右，计算能看到多少个楼
- 需要记录当前看到的最高楼 highest 
- 通过打擂台算法不断更新 highest, 每次更新就说明又看到了一个楼
- 记录更新的次数即可

### Answer: Brute Force
```c++
class Solution {
 public:
  /**
   * @param arr: the height of all buildings
   * @return: how many buildings can he see at the location of each building
   */
  std::vector<int> tallBuilding(std::vector<int>& arr) {
    // 一定能看到当前位置的楼
    std::vector<int> results(arr.size(), 1);
    for (int i = 0; i < arr.size(); ++i) {
      // 向右看能看到多少楼
      CountBuildings(arr, results, i, i + 1, arr.size(), 1);
      // 向左看能看到多少楼
      CountBuildings(arr, results, i, i - 1, -1, -1);
    }
    return results;
  }
 private:
  void CountBuildings(std::vector<int>& arr, std::vector<int>& results, int index, int start, int end, int delta) {
    int highest = 0xcfcfcfcf;
    int can_be_seen = 0;
    for (int i = start; i != end; i += delta) {
      if (highest < arr[i]) {
        highest = arr[i];
        ++can_be_seen;
      }
    }
    results[index] += can_be_seen;
  }
};
```

```python
    def tall_building(self, arr: List[int]) -> List[int]:
        # 一定能看到当前位置的楼
        results = [1] * len(arr)
        for i in range(len(arr)):
            # 向右看能看到多少楼
            self.count_buildings(arr, results, i, range(i + 1, len(arr)))
            # 向左看能看到多少楼
            self.count_buildings(arr, results, i, range(i - 1, -1, -1))
        return results
    def count_buildings(self, arr, results, index, index_list):
        highest, can_be_seen = float("-inf"), 0
        for i in index_list:
            if highest < arr[i]:
                highest = arr[i]
                can_be_seen += 1
        results[index] += can_be_seen

```

### 复杂度分析：Brute Force
- 遍历每个下标 `i`: O(N)
- 每个下标 `i` 向左右查找整个数组: O(N)
- 总时间复杂度: O(N^2)
- 空间复杂度: O(N)

## 解法二：Monotonic Stack
- 对于疑似单调栈的问题，一定要通过*样例模拟*

1. 从头到尾，从尾到头进行两次单调栈
2. 分别站在某个位置上向左，向右能看见多少楼房
3. 入栈前的栈的大小就是能看见的房子数量

### Answer: Monotonic Stack
```c++
class Solution {
 public:
  /**
   * @param arr: the height of all buildings
   * @return: how many buildings can he see at the location of each building
   */
  std::vector<int> tallBuilding(std::vector<int>& arr) {
    // 一定能看到当前位置的楼
    std::vector<int> results(arr.size(), 1);
    // 向右看能看到多少楼
    CountBuildings(arr, results, 0, arr.size(), 1);
    // 向左看能看到多少楼
    CountBuildings(arr, results, arr.size() - 1, -1, -1);
    return results;
  }
 private:
  void CountBuildings(std::vector<int>& arr, std::vector<int>& results, int start, int end, int delta) {
    std::deque<int> stack;
    for (int i = start; i != end; i += delta) {
      results[i] += stack.size(); // 在这里记录答案，与模版不同
      while (!stack.empty() && arr[stack.back()] <= arr[i]) {
        stack.pop_back();
      }
      stack.push_back(i);
    }
  }
};
```

```python
    def tall_building(self, arr: List[int]) -> List[int]:
        # 一定能看到当前位置的楼
        results = [1] * len(arr)
        # 向右看能看到多少楼
        self.count_buildings(arr, results, range(len(arr)))
        # 向左看能看到多少楼
        self.count_buildings(arr, results, range(len(arr) - 1, -1, -1))
        return results
    def count_buildings(self, arr, results, index_list):
        stack = []
        for i in index_list:
            results[i] += len(stack) # 在这里记录答案，与模版不同
            while stack and arr[stack[-1]] <= arr[i]:
                stack.pop(-1)
            stack.append(i)
```


# 3
- [Lintcode 362 滑动窗口的最大值](https://www.lintcode.com/problem/362/)
- [Leetcode 239 Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/description/)

## 解法一：枚举所有窗口
- 本题仍然属于子数组问题
- 最直接的办法依然是枚举子数组
- 由于子数组长度已给出，所以不需要枚举终点
- 每个子数组打擂台算出最大值

### Answer: 枚举所有窗口: Time Limit Exceeded
```c++
class Solution {
 public:
  std::vector<int> maxSlidingWindow(std::vector<int>& nums, int k) {
    std::vector<int> results;
    if (nums.size() == 0) {
      return results;
    }

    int n = nums.size();
    for (int i = 0; i < n - k + 1; ++i) {
      int max_value = 0xcfcfcfcf;
      for (int j = i; j < i + k; ++j) {
        max_value = std::max(max_value, nums[j]);
      }
      results.push_back(max_value);
    }
    return results;
  }
};
```

```python
class Solution:
  def maxSlidingWindow(self, nums: List[int], k: int) -> List[int]:
    if not nums:
      return []

    results = []
    n = len(nums)
    for i in range(0, n - k + 1):
      max_value = -float("inf")
      for j in range(i, i + k):
        max_value = max(max_value, nums[j])
      results.append(max_value)
    return results
```

### 复杂度分析：枚举所有窗口
- 窗口的长度给定，只需要枚举起点:O(n) 
- 打擂台计算窗口内的最大值:O(k) 
- 总时间复杂度:O(n * k) 
- 需要存放答案，空间复杂度:O(n)

## Follow Up 思路
待补充。。。

